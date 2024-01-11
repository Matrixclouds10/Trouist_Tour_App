import 'package:flutter/material.dart';

class NavigatePages {

  static void pushToPage(Widget widget,context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
  static void pushReplacePage(Widget widget,context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
  }
  // static void persistentNavBarNavigator(Widget widget,context){
  // PersistentNavBarNavigator.pushNewScreen( context, screen: widget, withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.cupertino, );
  //
  // }
  static void popNavBarNavigator(context){
    Navigator.pop(context);
  }
}