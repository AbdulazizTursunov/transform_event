part of 'free_game_bloc.dart';

  class FreeGameState extends Equatable {
  const FreeGameState({
     this.status = Status.initial,
    this.errorText = '',
    this.gameModel =const []
});

  FreeGameState copyWith({
    Status? status,
    String? errorText,
    List<GamingName>? gameModel,
})=>FreeGameState(
    status: status ?? this.status,
    errorText: errorText ?? this.errorText,
    gameModel:  gameModel ?? this.gameModel
  );

  final Status status;
  final String errorText;
  final List<GamingName> gameModel;

  @override
  List<Object?> get props => [status,errorText,gameModel];
}

