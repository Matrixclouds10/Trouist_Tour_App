import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/core/networking/dio_factory.dart';
import 'package:tourist_tour_app/core/networking/test.dart';
import 'package:tourist_tour_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/booking/data/repo/booking_repo.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/favorite/data/repo/favorite_repo.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/repos/home_repo.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/data/repo/make_program_repo.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/feature/more/data/repo/more_repo.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  dio.interceptors.add(ApiResponseInterceptor()); // Add interceptor to Dio instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio,));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt())); 
  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  //more
  getIt.registerLazySingleton<MoreRepo>(() => MoreRepo(getIt()));
  getIt.registerFactory<MoreCubit>(() => MoreCubit(getIt()));
//favorite
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(getIt()));
  //booking
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepo(getIt()));
  getIt.registerFactory<BookingCubit>(() => BookingCubit(getIt()));

   //make program
  getIt.registerLazySingleton<MakeProgramRepo>(() => MakeProgramRepo(getIt()));
  getIt.registerFactory<MakeProgramCubit>(() => MakeProgramCubit(getIt()));

}
