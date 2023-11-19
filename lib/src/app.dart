import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/src/data/services/app_services.dart';
import 'package:untitled/src/ui/pages/current_limits/page/current_limites_page.dart';
import 'package:untitled/src/ui/pages/facade/calculator/screens/meta_calculator_acade.dart';
import 'package:untitled/src/ui/pages/limitar_bola/page/add_limites_page.dart';
import 'package:untitled/src/ui/pages/login/login_page.dart';
import 'package:untitled/src/ui/pages/next_limits/page/next_limites_page.dart';
import 'package:untitled/src/ui/pages/pages.dart';
import 'package:untitled/src/ui/pages/pass_register/pass_screen.dart';
import 'package:untitled/src/ui/pages/pass_register/pass_screen_register.dart';
import 'package:untitled/src/ui/pages/players/index.dart';
import 'package:untitled/src/ui/pages/players/page/add_player/add_player_sm.dart';
import 'package:untitled/src/ui/pages/players/page/edit_player/edit_player_page.dart';
import 'package:untitled/src/ui/router/route_utils.dart';

import 'aplication/type_of_user.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  @override
  MyAppState createState() => MyAppState();
}

bool accessGuard() {
  var navigate = true;
  if ((DateTime.now().month == 4) && (DateTime.now().day <= 30)) {
    navigate = true;
  }
  return navigate;
}

Future<void> setLastLoginTime() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final DateTime now = DateTime.now();
  final String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  await prefs.setString('lastLoginTime', formattedTime);
}

Future<void> getLastLoginTime(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? lastLoginTime = prefs.getString('lastLoginTime');
  final String? session = prefs.getString('session');

  if (session != null) {
    if (session == 'expired') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      if (lastLoginTime != null) {
        final DateTime lastLogin = DateTime.parse(lastLoginTime);
        final DateTime now = DateTime.now();
        final Duration difference = now.difference(lastLogin);
        if (difference.inMinutes >= 20) {
          prefs.remove('access_token');
          prefs.remove('refresh_token');
          prefs.remove('key');
          prefs.remove('authenticated');
          prefs.remove("user_type");
          prefs.setString('session', 'expired');
          Navigator.pushReplacementNamed(context, "facade");
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const PassScreen()),
          );
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}

class MyAppState extends State<MyApp> {
  late AppService appService;

  @override
  void initState() {
    appService = AppService(widget.sharedPreferences);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Preferencias',
            initialRoute: "facade",
            routes: <String, WidgetBuilder>{
              "facade": (BuildContext context) => const MetaCalculatorFacade(),
              "/": (BuildContext context) => const LoginPage(),
              "register": (BuildContext context) => const PassScreenRegister(),
              "pass": (BuildContext context) => const PassScreen(),
              AppPages.home.name: (BuildContext context) => const HomePage(),
              AppPages.generalCollector.name: (BuildContext context) =>
              const ColectorGeneral(
                adminId: '',
                day: 0,
                month: 0,
                year: 0,
                turn: "",
              ),
              AppPages.collector.name: (BuildContext context) => const ColectorPage(
                generalCollectorId: '',
                day: 0,
                month: 0,
                year: 0,
                turn: "",
              ),
              AppPages.listMaker.name: (BuildContext context) =>
              const FootCollectorsPage(
                collectorId: '',
                day: 0,
                month: 0,
                year: 0,
                turn: "",
              ),
              AppPages.rules.name: (BuildContext context) => const ReglasView(
                ruleName: 'General',
              ),
              //AppPages.parle.name: (BuildContext context) => const LimitarParle(),
              AppPages.programedLimits.name: (BuildContext context) =>
              const ProgramedLimits(),
              AppPages.currentLimits.name: (BuildContext context) =>
              const CurrentLimits(),
              AppPages.nextLimits.name: (BuildContext context) =>
              const NextLimits(),
              AppPages.addLimits.name: (BuildContext context) => const AddLimites(),
              AppPages.editLimits.name: (BuildContext context) =>
              const AddLimites(),
              AppPages.bet.name: (BuildContext context) => const TiradaManager(),
              AppPages.players.name: (BuildContext context) =>
              const PlayersDashboard(
                defaultTabIndex: 0,
              ),
              AppPages.changePass.name: (BuildContext context) =>
              const ChangePassPage(),
              AppPages.addPlayer.name: (BuildContext context) =>
              const AddPlayerPage(
                fromTabIndex: 0,
                editMode: false,
                editPlayerType: '',
                // players: [],
                addPlayerType: TypeOfUser.unselected,
              ),
              AppPages.editPlayer.name: (BuildContext context) =>
              const EditPlayerPage(
                fromTab: 0,
              )
            },
            theme: ThemeData(
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color.fromRGBO(152, 41, 33, 1),
                onPrimary: Colors.black,
                secondary: Colors.grey,
                onSecondary: Colors.grey,
                error: Color.fromRGBO(152, 41, 33, 1),
                onError: Color.fromRGBO(152, 41, 33, 1),
                background: Colors.grey,
                onBackground: Colors.grey,
                surface: Colors.grey,
                onSurface: Colors.grey,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                hourMinuteShape: const CircleBorder(),
              ),
            ));
      },
    );

  }
}
