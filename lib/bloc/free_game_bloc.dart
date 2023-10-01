import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:transform_event/model/enum_model.dart';
import 'package:transform_event/model/gaming_name.dart';
import 'package:transform_event/repo/repo.dart';
import 'package:transform_event/service/api_service.dart';

part 'free_game_event.dart';
part 'free_game_state.dart';

// const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class FreeGameBloc extends Bloc<FreeGameEvent, FreeGameState> {
  FreeGameBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const FreeGameState()) {
    on<GetFreeGame>(getFreegame);
  }

  Future<void> getFreegame(
      GetFreeGame event, Emitter<FreeGameState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final data = await _apiRepository.getFreeGame();
      // debugPrint(data as String?);
      emit(state.copyWith(status: Status.success, gameModel: data));
    } catch (e) {
      emit(state.copyWith(status: Status.error,errorText: e.toString()));
      throw DioFailure(massage: e.toString());
    }
  }

  final ApiRepository _apiRepository;
}
