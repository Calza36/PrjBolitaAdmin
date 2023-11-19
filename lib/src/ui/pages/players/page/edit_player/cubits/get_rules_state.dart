part of 'get_rules_cubit.dart';

@immutable
abstract class GetRulesState {}

class GetRulesInitial extends GetRulesState {}

class GetRulesLoading extends GetRulesState {}

class GetRulesReady extends GetRulesState {
  final Rule rules;
  GetRulesReady(this.rules);
}

class GetRulesError extends GetRulesState {
  final String message;
  GetRulesError(this.message);
}
