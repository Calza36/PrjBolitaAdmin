import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';

import '../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';

part 'update_limited_state.dart';

class UpdateNextDayLimitedCubit extends Cubit<UpdateNextDayLimitedState> {
  UpdateNextDayLimitedCubit(super.initialState);
  LimitationConfigRepository limitationConfigRepository =
      LimitationConfigRepository();
  Future<void> editLimited(LimitsEntity newCurrentLimitedEntity) async {
    try {
      emit(UpdateLimitedLoadingState());
      final result = await limitationConfigRepository
          .updateNextDayLimited(newCurrentLimitedEntity);
      if (result['succces'] != null) {
        emit(UpdateLimitedFinishedState(result['succces']));
      } else {
        emit(UpdateLimitedErrorState(result['message']));
      }
    } on Exception catch (e) {
      emit(UpdateLimitedErrorState(e.toString()));
    }
  }
}
