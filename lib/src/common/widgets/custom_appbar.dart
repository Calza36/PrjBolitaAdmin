// import 'package:flutter/material.dart';
// import 'package:untitled/src/ui/router/route_utils.dart';
//
// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppbar({
//     Key? key,
//     this.actions,
//   })  : preferredSize = const Size.fromHeight(kToolbarHeight),
//         super(key: key);
//
//   final List<Widget>? actions;
//
//   @override
//   final Size preferredSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       centerTitle: false,
//       titleSpacing: 10,
//       leading: canPop
//           ? IconButton(
//               onPressed: () {
//                 context.pop();
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 size: 15,
//                 color: Colors.white,
//               ),
//             )
//           : null,
//       title: Text(AppPages.currentPage(context).title),
//       actions: actions,
//     );
//   }
// }
