import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../domain/all_players/entity/index.dart';
import '../../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';

part 'get_players_state.dart';

class GetPlayersCubit extends Cubit<GetPlayersState> {
  GetPlayersCubit() : super(GetPlayersInitial());

  Future<void> fetchPlayers() async {
    emit(GetPlayersLoading());
    var players =
        await PlayerAllRepository().getPlayerAllEntitiesByAscendancy();

    if (players['success'] != null) {
      var listPlayerAbstractEntity =
          players['success'] as List<PlayerAbstractEntity>;
      emit(GetPlayersReady(listPlayerAbstractEntity));
    } else {
      emit(GetPlayersError(players['message']));
    }
  }
}
