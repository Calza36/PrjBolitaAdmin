import 'package:flutter/material.dart';
import 'package:untitled/src/ui/pages/pages.dart';

import '../../aplication/type_of_user.dart';
import '../pages/current_limits/page/current_limites_page.dart';
import '../pages/limitar_bola/page/add_limites_page.dart';
import '../pages/list/page/list_page.dart';
import '../pages/login/login_page.dart';
import '../pages/next_limits/page/next_limites_page.dart';
import '../pages/pass_register/pass_screen.dart';
import '../pages/pass_register/pass_screen_register.dart';
import '../pages/players/index.dart';
import '../pages/players/page/add_player/add_player_sm.dart';
import '../pages/players/page/edit_player/edit_player_page.dart';

enum AppPages {
  home(
    name: 'home',
    path: '/home',
    title: 'ListDigital Administrador',
    pageWidget: HomePage(),
  ),
  login(
    name: 'login',
    path: '/',
    title: 'Iniciar Sesión',
    pageWidget: LoginPage(),
  ),
  register(
    name: 'register',
    path: '/register',
    title: 'Register',
    pageWidget: PassScreenRegister(),
  ),
  pass(
    name: 'pass',
    path: '/pass',
    title: 'Pass',
    pageWidget: PassScreen(),
  ),
  storage(
    name: 'storage',
    path: '/storage',
    pageWidget: Almacenamiento(),
    title: 'Almacenamiento',
    icon: Icon(Icons.sd_storage, size: 30),
  ),
  collector(
    name: 'collector',
    path: '/collector',
    pageWidget: ColectorPage(
      generalCollectorId: '',
      day: 0,
      month: 0,
      year: 0,
      turn: "",
    ),
    icon: Icon(Icons.people, size: 30),
    title: 'Colectores',
  ),
  generalCollector(
    name: 'generalCollector',
    path: '/generalCollector',
    pageWidget: ColectorGeneral(
      adminId: '',
      day: 0,
      month: 0,
      year: 0,
      turn: "",
    ),
    icon: Icon(Icons.people_alt, size: 30),
    title: 'Colectores Generales  ',
  ),
  programedLimits(
    name: 'programedLimits',
    path: '/programedLimits',
    pageWidget: ProgramedLimits(),
    icon: Icon(Icons.pending_actions_rounded, size: 30),
    title: 'Limitados Programados',
  ),
  currentLimits(
    name: 'currentLimits',
    path: '/currentLimits',
    pageWidget: CurrentLimits(),
    icon: Icon(Icons.signal_cellular_nodata_outlined, size: 30),
    title: 'Limitados',
  ),
  nextLimits(
    name: 'nextLimits',
    path: '/nextLimits',
    pageWidget: NextLimits(),
    icon: Icon(Icons.signal_cellular_connected_no_internet_0_bar_outlined, size: 30),
    title: 'Limitados para Mañana',
  ),
  addLimits(
    name: 'addlimits',
    path: '/addlimits',
    pageWidget: AddLimites(),
    icon: Icon(Icons.label_important_outline_sharp, size: 30),
    title: 'Limites de Jugadas',
  ),
  editLimits(
    name: 'editlimits',
    path: '/editlimits',
    pageWidget: AddLimites(),
    icon: Icon(Icons.label_important_outline_sharp, size: 30),
    title: 'Editando limitados de turno',
  ),
  /*parle(
    name: 'parle',
    path: '/parle',
    pageWidget: LimitarParle(),
    icon: Icon(Icons.label_important_outline_sharp, size: 30),
    title: 'Limitar Parle',
  ),*/
  //listero
  listMaker(
    name: 'listMaker',
    path: '/listMaker',
    pageWidget: FootCollectorsPage(
      collectorId: '',
      day: 0,
      month: 0,
      year: 0,
      turn: "",
    ),
    title: 'Listeros',
    icon: Icon(Icons.list_alt, size: 30),
  ),
  listVisually(
    name: 'listVisually',
    path: '/listVisually',
    pageWidget: ListPage(
      footCollectorId: '',
      day: 0,
      month: 0,
      year: 0,
      turn: "",
    ),
    title: 'Lista',
    icon: Icon(Icons.document_scanner_sharp, size: 30),
  ),
  abstract(
    name: 'abstract',
    path: '/abstract',
    pageWidget: Resumen(),
    title: 'Resumen',
    icon: Icon(Icons.show_chart, size: 30),
  ),
  report(
    name: 'report',
    path: '/report',
    pageWidget: Reporte(),
    title: 'Reportes',
    icon: Icon(Icons.report, size: 30),
  ),
  rules(
    name: 'rules',
    path: '/rules',
    title: 'Regla General',
    pageWidget: ReglasView(
      ruleName: 'General',
      ruleElement: null,
    ),
    icon: Icon(Icons.rule, size: 30),
  ),
  players(
    name: 'players',
    path: '/players',
    title: 'Jugadores',
    pageWidget: PlayersDashboard(
      defaultTabIndex: 0,
    ),
    icon: Icon(Icons.supervised_user_circle_outlined, size: 30),
  ),
  changePass(
    name: 'changePass',
    path: '/changePass',
    pageWidget: ChangePassPage(),
    title: 'Cambiar Contraseña',
    icon: Icon(Icons.key, size: 30),
  ),
  addPlayer(
    name: 'addPlayer',
    path: '/addPlayer',
    pageWidget: AddPlayerPage(
      fromTabIndex: 0,
      editMode: false,
      editPlayerType: '',
      //players: [],
      addPlayerType: TypeOfUser.unselected,
    ),
    title: 'Adgregar Jugador',
    icon: Icon(Icons.person_add, size: 30),
  ),
  editPlayer(
    name: 'editPlayer',
    path: '/editPlayer',
    pageWidget: EditPlayerPage(
      fromTab: 0,
    ),
    title: 'Adgregar Jugador',
    icon: Icon(Icons.person_add, size: 30),
  ),
  //tirada
  bet(
    name: 'bet',
    path: '/bet',
    pageWidget: TiradaManager(),
    icon: Icon(Icons.lens_blur_outlined, size: 30),
    title: 'Poner Tiros',
  );

  final String path;
  final String name;
  final String title;
  final Widget pageWidget;
  final Widget icon;

  // static AppPages currentPage(BuildContext context) {
  //   // return values.firstWhere(
  //   //   (page) => page.path == GoRouter.of(context).location,
  //   // );
  // }

  const AppPages({
    required this.path,
    required this.name,
    this.title = '',
    required this.pageWidget,
    this.icon = const SizedBox.shrink(),
  });
}
