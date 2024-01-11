import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralFunctions {
  static Future<void> dialNumber({required String mobileNumber}) async {
    // await FlutterPhoneDirectCaller.callNumber(mobileNumber);
  }

  static void unFocusCursorRTL(TextEditingController controller) {
    if (controller.selection ==
        TextSelection.fromPosition(
            TextPosition(offset: controller.text.length - 1))) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  static void hideKeyboard() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static void setPreferredOrientation() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // static moveCameraPosition(
  //     {required LatLng latLng,
  //     required Completer<GoogleMapController> mapController}) async {
  //   final GoogleMapController controller = await mapController.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(target: latLng, zoom: 14)));
  // }

  // static String dateFormat({required String dateTime}) {
  //   String formattedDate =
  //       '${DateFormat.yMMMMEEEEd().format(DateTime.parse(dateTime))}\n'
  //       '${hoursList[hoursMapper.indexOf(DateFormat.H().format(DateTime.parse(dateTime)))]}';
  //   return formattedDate;
  // }

  static ColorFilter getFilterColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
