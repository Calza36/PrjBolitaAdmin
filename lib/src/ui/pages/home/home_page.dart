import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/src/ui/pages/login/login_page.dart';
import 'package:untitled/src/ui/router/route_utils.dart';

import '../../../app.dart';
import '../../../data/services/get_it_mock.dart';
import '../../../infrastructure/ruler/dtos/rule.dart';
//import '../login/loadin_screen.dart';
import '../login/loadin_screen.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "home";

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

String? userType;

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    userType = GetItMock.prefs.getString("user_type");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool exit = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('¿Desea salir de la aplicación?'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ElevatedButton(
                    child: const Text('Salir'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              );
            },
          );

          // Si el usuario confirma la salida, cerrar la aplicación
          if (exit == true) {
            SystemNavigator.pop();
          }

          // Impedir que el botón de retroceso cierre la pantalla
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            title: Text(GetItMock.prefs.getString('user_name')!),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                ),
                onPressed: () {
                  _mostrarAlerta(context);
                },
              )
            ],
          ),
          body: accessGuard()
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: ListView(
                    children: [
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            const SizedBox(height: 15.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Jugadores",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    // color: Color.fromARGB(
                                    //   255,
                                    //   33,
                                    //   150,
                                    //   235,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            (userType == 'GeneralCollector' ||
                                    userType == 'Collector')
                                ? Container()
                                : const HomeOptionsListTile(
                                    page: AppPages.generalCollector,
                                  ),
                            (userType == 'Collector')
                                ? Container()
                                : const HomeOptionsListTile(
                                    page: AppPages.collector,
                                  ),
                            const HomeOptionsListTile(
                              page: AppPages.listMaker,
                            ),
                          ],
                        ),
                      ),
                      /*Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Mis Estadísticas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ],
                  ),
                  const HomeOptionsListTile(
                    page: AppPages.abstract,
                  ),
                  const HomeOptionsListTile(
                    page: AppPages.storage,
                  ),
                  const HomeOptionsListTile(
                    page: AppPages.report,
                  ),
                ],
              ),
            ),*/
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            const SizedBox(height: 15.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Administrar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                  ),
                                ),
                              ],
                            ),
                            const HomeOptionsListTile(
                              page: AppPages.players,
                            ),
                            const HomeOptionsListTileRule(
                              page: AppPages.rules,
                            ),
                            const HomeOptionsListTile(
                              page: AppPages.currentLimits,
                            ),
                            (userType == 'GeneralCollector' ||
                                userType == 'Collector')
                                ? Container()
                                : const HomeOptionsListTile(
                              page: AppPages.nextLimits,
                            ),

                            /*
                        const HomeOptionsListTile(
                          page: AppPages.programedLimits,
                        ),
                        const HomeOptionsListTile(
                    page: AppPages.parle,
                  ),*/
                           (userType != 'Admin')
                                                           ? Container()
                                                           : const HomeOptionsListTile(
                              page: AppPages.bet,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Column(
                          children: [
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Usuario",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                  ),
                                ),
                              ],
                            ),
                            HomeOptionsListTile(
                              page: AppPages.changePass,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ));
  }

  _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Salir de ListDigital Administrador",
            ),
            content: const Text(
              "Desea salir de la App ?",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                  )),
              ElevatedButton(
                onPressed: () {
                  //todo: remove local storage app data
                  clearLocalUserData();
                  //context.goNamed(AppPages.login.name);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Aceptar'),
              ),
            ],
          );
        });
  }

  void clearLocalUserData() {
    GetItMock.prefs.remove('access_token');
    GetItMock.prefs.remove('refresh_token');
    GetItMock.prefs.remove('key');
    GetItMock.prefs.remove('authenticated');
    GetItMock.prefs.remove("user_type");
    Navigator.pop(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      getLastLoginTime(context);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class HomeOptionsListTile extends StatelessWidget {
  const HomeOptionsListTile({
    super.key,
    required this.page,
  });

  final AppPages page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: page.icon,
      iconColor: Colors.black87,
      title: Text(page.title),
      trailing: IconButton(
        onPressed: () {
          //Navigator.pushReplacementNamed(context, page.name);
          Navigator.pushNamed(context, page.name);
        },
        icon: const Icon(
          Icons.play_arrow,
          size: 20,
          color: Colors.black87,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, page.name);
      },
    );
  }
}

class HomeOptionsListTileRule extends StatelessWidget {
  const HomeOptionsListTileRule({
    super.key,
    required this.page,
  });

  final AppPages page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: page.icon,
      iconColor: Colors.black87,
      title: Text(page.title),
      trailing: IconButton(
        onPressed: () {
          _loadRules(context);
        },
        icon: const Icon(
          Icons.play_arrow,
          size: 20,
          color: Colors.black87,
        ),
      ),
      onTap: () {
        _loadRules(context);
      },
    );
  }

  void _loadRules(context) async {
    LoadingScreen.show(context, "Cargando, por favor espere...");
    var rule = await const Rule().getGeneral();
    LoadingScreen.hide(context);
    goGeneralRule(context, rule);
  }

  void goGeneralRule(BuildContext context, RuleElement rule) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ReglasView(
                ruleName: 'General',
                ruleElement: rule,
              )),
    );
  }
}
