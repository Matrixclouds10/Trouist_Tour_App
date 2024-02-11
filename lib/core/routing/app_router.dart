import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:tourist_tour_app/feature/auth/login/presentation/login.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/register.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/screens/splash_screen.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.rootScreen:
        return MaterialPageRoute(
          builder: (_) => const RootPages(),
        );
        case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
        case Routes.logAsScreen:
        return MaterialPageRoute(
          builder: (_) => const LogAs(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
