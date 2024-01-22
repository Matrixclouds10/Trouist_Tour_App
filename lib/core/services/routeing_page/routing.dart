import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigatePages {

  static void pushToPage(Widget widget,context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
  static void pushReplacePage(Widget widget,context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
  }
  static void persistentNavBarNavigator(Widget widget,context){
  PersistentNavBarNavigator.pushNewScreen( context, screen: widget, withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.cupertino, );

  }
  static void popNavBarNavigator(context){
    Navigator.pop(context);
  }
}