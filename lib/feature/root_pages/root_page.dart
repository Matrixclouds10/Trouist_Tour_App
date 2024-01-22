import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_screen.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/screens/favorite_screen.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/home.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/more_screen.dart';
import 'package:tourist_tour_app/feature/search/presentation/screen/search_screen.dart';

class RootPages extends StatefulWidget {
  final String? check;
  const RootPages({super.key, this.check});

  @override
  State<RootPages> createState() => _RootPagesState();
}
class _RootPagesState extends State<RootPages> {
   List<Widget> buildScreens() {
     return const[
        Home(),
        FavoriteScreen(),
       SearchScreen(),
       BookingScreen(),
       MoreScreen(),
     ];
   }
   @override
  void initState() {
     if(widget.check==null){
       controller.index=0;
     }else{
       controller.index=int.parse(widget.check!).toInt();
     }
     super.initState();
  }

   PersistentTabController controller= PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    final List<PersistentBottomNavBarItem> items=[
      PersistentBottomNavBarItem(icon:  const Icon(Icons.home_outlined) ,
          title: 'Home', inactiveColorPrimary:const Color(0xff818181), activeColorPrimary:const Color(0xff009688,),
      inactiveIcon: const Icon(Icons.home_outlined)
      ),
      PersistentBottomNavBarItem(
      inactiveIcon: const Icon(Icons.favorite_border),
      icon: const Icon(Icons.favorite_border),title: 'Favorite',inactiveColorPrimary:const Color(0xff818181),activeColorPrimary:const Color(0xff009688)),
      PersistentBottomNavBarItem(
      inactiveIcon: const Icon(Icons.search,size:30,color:  Color(0xff009688),),
      icon: const Icon(Icons.search,size:35,color: Color(0xff009688),),title: 'Search',inactiveColorPrimary:const Color(0xff818181),activeColorPrimary:Colors.white),
      PersistentBottomNavBarItem(
          inactiveIcon: const Icon(Icons.calendar_month_outlined),
          icon: const Icon(Icons.calendar_month_outlined),title: 'Booking',inactiveColorPrimary:const Color(0xff818181),activeColorPrimary:const Color(0xff009688)),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.menu_outlined),
        icon: const Icon(Icons.menu_outlined),title: 'More',inactiveColorPrimary:const Color(0xff818181),activeColorPrimary:const Color(0xff009688),)];

    return Scaffold(
      bottomNavigationBar:
      PersistentTabView(
        context,
        controller: controller,
        screens: buildScreens(),
        items: items,
        confineInSafeArea: true,
        backgroundColor: const Color(0xff8E8E8E).withOpacity(0.15), // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      )

    );
  }
}
