import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/di/dependency_injection.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/routing/app_router.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/cubit.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/screens/splash_screen.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/shared_preference/shared_preference.dart';

void main()async {
  // ServicesLocator().init();
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
      DevicePreview(
        enabled: false,
        builder: (context) =>  TouristTourApp(
          appRouter: AppRouter(),
        )),);
}
class TouristTourApp extends StatelessWidget {
  final AppRouter appRouter;
  const TouristTourApp({super.key, required this.appRouter,});
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
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
            // home:MediaQuery(
            //   data: MediaQuery.of(context).copyWith(
            //     textScaleFactor: 1.0, // تعطيل textScaleFactor على مستوى التطبيق
            //   ),
            //
            //   child:const SplashScreen()
            // ),
            // onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}