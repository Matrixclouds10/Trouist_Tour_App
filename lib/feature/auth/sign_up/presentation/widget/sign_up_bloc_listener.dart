import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';

import '../../logic/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color:AppColorLight.primaryColor,
                ),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            context.pop();
            context.pushNamed(Routes.rootScreen);
            CacheHelper.saveDate(key: 'isLog', value: true);
            // showSuccessDialog(context);
          },
          signupError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                context.pushNamed(Routes.rootScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
        content: Text(
          error,
          style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
        fontFamily: AppFontsFamily.fontCairo,
            color: AppColorLight.customBlack
        ),),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
            ),
          ),
        ],
      ),
    );
  }
}
