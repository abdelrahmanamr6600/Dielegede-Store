import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/const.dart';
import 'package:dielegende_store/features/category/data/repo/CategoryRepo.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/home/data/repo/HomeRepo.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/login/data/repo/LoginRepo.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginCubit.dart';
import 'package:dielegende_store/features/profile/data/repo/ProfileRepo.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileCubit.dart';
import 'package:dielegende_store/features/register/data/repo/RegisterRepo.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/wish_list/data/repo/WishListRepo.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: baseUrl)));
  sl.registerLazySingleton(() => ApisService(sl<Dio>()));
  sl.registerLazySingleton(() => RegisterRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => LoginRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => HomeRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => CategoryRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => WishListRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => Profilerepo(sl<ApisService>()));
  sl.registerLazySingleton(() => StoreProductsRepo(sl<ApisService>()));

  // sl.registerFactory(() => RegisterCubit(sl<RegisterRepo>()));
  sl.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(sl<RegisterRepo>()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl<HomeRepo>()));
  sl.registerLazySingleton<CategoryCubit>(
      () => CategoryCubit(sl<CategoryRepo>()));
  sl.registerLazySingleton<WishListCubit>(
      () => WishListCubit(sl<WishListRepo>()));
  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(sl<Profilerepo>()));
    sl.registerLazySingleton<StoreProductsCubit>(() => StoreProductsCubit(sl<StoreProductsRepo>()));

}
