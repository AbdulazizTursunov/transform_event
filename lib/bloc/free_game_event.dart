part of 'free_game_bloc.dart';

sealed class FreeGameEvent extends Equatable {
  const FreeGameEvent();
}

class GetFreeGame extends FreeGameEvent{
  @override
  List<Object?> get props => [];
}
