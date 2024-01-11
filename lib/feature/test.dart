// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// class RootPages extends StatefulWidget {
//
//   const RootPages({super.key});
//
//   @override
//   State<RootPages> createState() => _RootPagesState();
//
// }
//
// class _RootPagesState extends State<RootPages> {
//   int selectedIndex=0;
//
//   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
//     return Container(
//       alignment: Alignment.center,
//       height: 60.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Flexible(
//             child: IconTheme(
//               data: IconThemeData(
//                   size: 26.0,
//                   color: isSelected
//                       ? (item.activeColorSecondary ?? item.activeColorPrimary)
//                       : item.inactiveColorPrimary ?? item.activeColorPrimary),
//               child: item.icon,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Material(
//               type: MaterialType.transparency,
//               child: FittedBox(
//                   child: Text(
//                     item.title!,
//                     style: TextStyle(
//                         color: isSelected
//                             ? (item.activeColorSecondary ?? item.activeColorPrimary)
//                             : item.inactiveColorPrimary,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.0),
//                   )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<PersistentBottomNavBarItem> items=[
//       PersistentBottomNavBarItem(
//           icon: const Icon(Icons.home_outlined),
//           title: 'Home',
//           inactiveColorPrimary:const Color(0xff818181),
//           activeColorPrimary:const Color(0xff009688,
//           )),
//       PersistentBottomNavBarItem(
//           icon: Icon(Icons.favorite_border),title: 'Favorite',inactiveColorPrimary:Color(0xff818181),activeColorPrimary:Color(0xff009688)),
//       PersistentBottomNavBarItem(title: 'Search', icon: InkWell(
//           onTap: (){
//             setState(() {
//               selectedIndex=2;
//               print(selectedIndex);
//             });
//           },
//           child: SizedBox(height: 25.h,)),inactiveColorPrimary:Color(0xff818181),activeColorPrimary:Color(0xff009688)),
//       PersistentBottomNavBarItem(icon: Icon(Icons.menu_outlined),title: 'Booking',inactiveColorPrimary:Color(0xff818181),activeColorPrimary:Color(0xff009688)),
//       PersistentBottomNavBarItem(icon: Icon(Icons.menu_outlined),title: 'More',inactiveColorPrimary:Color(0xff818181),activeColorPrimary:Color(0xff009688),)];
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               color: const Color(0xff8E8E8E).withOpacity(0.15),
//               width: double.infinity,
//               height: 61.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: items.map((item) {
//                   int index = items.indexOf(item);
//                   return Flexible(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex =index;
//                         });
//                       },
//                       child: _buildItem(
//                           item, selectedIndex == index),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 height: 90.h,
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                     height: 55.h,
//                     width: 55.w,
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(50))
//                     ),
//                     child: Icon(Icons.search,size: 33,color: Color(0xff009688),))
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
/*
Padding(
        padding: const EdgeInsets.all(50.0),
        child:
        HexagonOffsetGrid.oddPointy(
          columns: 1,
          rows: 1,
          buildTile: (col, row) => HexagonWidgetBuilder(
            color: row.isEven ? Colors.yellow : Colors.orangeAccent,
            elevation: 2,
          ),
          buildChild: (col, row) {
            return Text('$col, $row');
          },
        ),
        ),
 */