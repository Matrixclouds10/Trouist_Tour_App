import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';

void customShowDialog({required String title, required String body, required void Function()? onPressed,required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(body),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.grey,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              context.pop();
            },
            child: const Text('Exit'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppColorLight.primaryColor.withOpacity(0.70),
              onSurface: Colors.grey,
            ),
            onPressed:onPressed,
            child: const Text('Agree'),
          ),

        ],
      );
    },
  );
}