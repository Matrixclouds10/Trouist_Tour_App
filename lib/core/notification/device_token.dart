
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tourist_tour_app/core/di/dependency_injection.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_cubit.dart';

Future<String?> getDeviceToken(context) async {
  try {
    String? token = await FirebaseMessaging.instance.getToken();
    log("FCM token: $token");
    return token;
  } catch (e) {
    log("FCM token error:  $e");
    return null;
  }
}

