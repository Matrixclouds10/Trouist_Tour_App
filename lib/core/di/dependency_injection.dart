import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/core/networking/dio_factory.dart';
import 'package:tourist_tour_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/repos/sliders_repo.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt())); 
  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
