import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/const.dart';
import 'package:dielegende_store/features/login/data/repo/LoginRepo.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginCubit.dart';
import 'package:dielegende_store/features/register/data/repo/RegisterRepo.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: baseUrl)));
  sl.registerLazySingleton(() => ApisService(sl<Dio>()));
  sl.registerLazySingleton(() => RegisterRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => LoginRepo(sl<ApisService>()));

  // sl.registerFactory(() => RegisterCubit(sl<RegisterRepo>())); 
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl<RegisterRepo>()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));

}
