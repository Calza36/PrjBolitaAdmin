part of 'update_next_day_limited_cubit.dart';

@immutable
abstract class UpdateNextDayLimitedState {}

class UpdateLimitedInitialState extends UpdateNextDayLimitedState {}

class UpdateLimitedLoadingState extends UpdateNextDayLimitedState {}

class UpdateLimitedFinishedState extends UpdateNextDayLimitedState {
  final dynamic updateLimitedResponse;
  UpdateLimitedFinishedState(this.updateLimitedResponse);
}

class UpdateLimitedErrorState extends UpdateNextDayLimitedState {
  final String message;
  UpdateLimitedErrorState(this.message);
}
