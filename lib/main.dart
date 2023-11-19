import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/src/ui/pages/players/page/add_player/cubits/get_players_cubit.dart';
import 'package:untitled/src/ui/pages/players/page/edit_player/cubits/get_rules_cubit.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final getPlayersCubit = GetPlayersCubit();
  final getRulesCubit = GetRulesCubit();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getPlayersCubit,
        ),
        BlocProvider(
          create: (_) => getRulesCubit,
        ),
      ],
      child: MyApp(sharedPreferences: sharedPreferences),
    ));
  });
}
