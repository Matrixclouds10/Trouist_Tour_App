import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () async{
      var onBoarding = await CacheHelper.getDate(key: 'onBoarding');
      var isLog = await CacheHelper.getDate(key: 'isLog');
      String widget=Routes.onBoardingScreen;
      if (onBoarding != null)
      {
        if (isLog != null) {
          widget =Routes.rootScreen;
        }
        else {
          widget =Routes.logAsScreen;
        }
      }
      else {
        widget = Routes.onBoardingScreen;
      }
      await Future.delayed(const Duration(microseconds: 0)).then((value) {
        context.pushReplacementNamed(widget);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
