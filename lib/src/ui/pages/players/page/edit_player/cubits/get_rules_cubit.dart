import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/services/get_it_mock.dart';
import '../../../../../../infrastructure/ruler/index.dart';

part 'get_rules_state.dart';

class GetRulesCubit extends Cubit<GetRulesState> {
  GetRulesCubit() : super(GetRulesInitial());

  Future<void> fetchAllRules() async {
    emit(GetRulesLoading());
    Map<String, dynamic> players = await RuleProvider().getPrivateRules();
    if (players['success'] != null) {
      String rsRawJson = jsonEncode(players['success'].toJson());
      GetItMock.prefs.setString("privateRules", rsRawJson);
      emit(GetRulesReady(players['success']!));
    } else {
      emit(GetRulesError(players['message']));
    }
  }
}
