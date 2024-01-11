import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/feature/auth/presentation/screens/login.dart';
import 'package:tourist_tour_app/feature/auth/presentation/screens/register.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/home.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/cubit.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/feature/test.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/services/services_locator.dart';
import 'core/shared_preference/shared_preference.dart';

void main()async {

  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const TouristTourApp()),);
}
class TouristTourApp extends StatelessWidget {
  // final AppRouter appRouter;
  const TouristTourApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppOnBoardingCubit()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tourist Tour',
            theme: ThemeData(
              primaryColor: AppColorLight.primaryColor,
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:const RootPages()
            // onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}

