import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/di/dependency_injection.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/helpers/bloc/help_cubit.dart';
import 'package:tourist_tour_app/core/routing/app_router.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/cubit.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/shared_preference/shared_preference.dart';

void main()async {
  // ServicesLocator().init();

  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var onBoarding = await CacheHelper.getDate(key: 'onBoarding');
  var isLog = await CacheHelper.getDate(key: 'isLog');
  print('onbording : $onBoarding');
  print('isLog : $isLog');
 /*  String widget=Routes.splashScreen;
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
     widget = Routes.splashScreen;
  }*/
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  // String deviceLanguage = await findSystemLocale();
  // print("sdfasafd $deviceLanguage");
  // print("sdfasafd ${deviceLanguage.substring(0,2)}");
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translation', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar'),
        // startLocale: Locale(deviceLanguage.substring(0,2)),
        child:  DevicePreview(
            enabled: false,
            builder: (context) =>
                TouristTourApp(
                  appRouter: AppRouter(),
                ),),),
     );
}
class TouristTourApp extends StatelessWidget {
  final AppRouter appRouter;

   const TouristTourApp({super.key, required this.appRouter,});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppOnBoardingCubit()),
        BlocProvider(create: (context) => HelpCubit()),
        BlocProvider(create: (context) => HomeCubit(getIt())),
        BlocProvider(create: (context) => MoreCubit(getIt())),
        BlocProvider(create: (context) => MoreCubit(getIt())),
        BlocProvider(create: (context) => SignupCubit(getIt())),
        BlocProvider(create: (context) => FavoriteCubit(getIt())),
        BlocProvider(create: (context) => BookingCubit(getIt())),
        BlocProvider(create: (context) => MakeProgramCubit(getIt())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return  MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Tourist Tour',
            theme: ThemeData(
              primaryColor: AppColorLight.primaryColor,
              scaffoldBackgroundColor: Colors.white,
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute:  Routes.splashScreen ,
            onGenerateRoute: appRouter.generateRoute,
            // home: OnBoardingScreen(),
            //update 26/2
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