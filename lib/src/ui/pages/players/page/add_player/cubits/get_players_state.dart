part of 'get_players_cubit.dart';

@immutable
abstract class GetPlayersState {}

class GetPlayersInitial extends GetPlayersState {}

class GetPlayersLoading extends GetPlayersState {}

class GetPlayersReady extends GetPlayersState {
  final List<PlayerAbstractEntity> players;
  GetPlayersReady(this.players);
}

class GetPlayersError extends GetPlayersState {
  final String message;
  GetPlayersError(this.message);
}
