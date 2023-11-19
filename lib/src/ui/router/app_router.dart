// import 'package:go_router/go_router.dart';
// import 'package:untitled/src/data/services/app_services.dart';
// import 'package:untitled/src/ui/router/route_utils.dart';
//
// class AppRouter {
//   late final AppService appService;
//
//   GoRouter get router => _goRouter;
//
//   AppRouter(this.appService);
//
//   late final GoRouter _goRouter = GoRouter(
//     refreshListenable: appService,
//     initialLocation: AppPages.login.path,
//     routes: <GoRoute>[
//       ...List.generate(
//         AppPages.values.length,
//         (index) {
//           final page = AppPages.values[index];
//           return GoRoute(
//             path: page.path,
//             name: page.name,
//             builder: (context, state) => page.pageWidget,
//           );
//         },
//       ),
//     ],
//   );
// }
