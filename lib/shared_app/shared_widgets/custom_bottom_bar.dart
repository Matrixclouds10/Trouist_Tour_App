// import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
// import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
// import 'package:tourist_tour_app/feature/home/pressentation/screens/home.dart';
//
//
// class CustomBottomBarWidget extends StatefulWidget {
//   const CustomBottomBarWidget({super.key, required this.currentIndex});
//  final int currentIndex;
//
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<CustomBottomBarWidget> {
//
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Bottom Bar Example'),
//       ),
//       body:
//       Stack(
//         children: [
//           const Home(),
//           Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: bottomNavigationBar())
//         ],
//       )
//       // bottomNavigationBar:
//       // BottomBarCreative(
//       //   items: items,
//       //   backgroundColor: const Color(0xff8E8E8E).withOpacity(0.15),
//       //   color: AppColorLight.gray2,
//       //   colorSelected: colorSelect,
//       //   indexSelected: visit,
//       //   isFloating: true,
//       //   highlightStyle:const HighlightStyle(sizeLarge: true,
//       //       background: Colors.red, elevation: 3),
//       //   onTap: (int index) => setState(() {
//       //     visit = index;
//       //   }),
//       //
//       // ),
//
//       //
//       // CustomBottomBar(
//       //   selectedIndex: _selectedIndex,
//       //   onItemTapped: _onItemTapped,
//       // ),
//     );
//   }
//
//
// }
//
//
//
