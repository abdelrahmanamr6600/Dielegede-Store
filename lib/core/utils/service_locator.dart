import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/const.dart';
import 'package:dielegende_store/features/bag/data/repo/BagRepo.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/category/data/repo/CategoryRepo.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryProductCubit.dart';
import 'package:dielegende_store/features/filter/data/FilterProductRepo.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProductCubit.dart';
import 'package:dielegende_store/features/follow_store/data/FollowStoreRepo.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/home/data/repo/HomeRepo.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/login/data/repo/LoginRepo.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginCubit.dart';
import 'package:dielegende_store/features/profile/data/repo/ProfileRepo.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileCubit.dart';
import 'package:dielegende_store/features/register/data/repo/RegisterRepo.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dielegende_store/features/search/data/repo/SearchRepo.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchCubit.dart';
import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreDetailsCubit.dart';
import 'package:dielegende_store/features/wish_list/data/repo/WishListRepo.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerFactory(() => Dio(BaseOptions(baseUrl: baseUrl)));
  sl.registerFactory(() => ApisService(sl<Dio>()));
  sl.registerFactory(() => RegisterRepo(sl<ApisService>()));
  sl.registerFactory(() => LoginRepo(sl<ApisService>()));
  sl.registerFactory(() => HomeRepo(sl<ApisService>()));
  sl.registerFactory(() => CategoryRepo(sl<ApisService>()));
  sl.registerFactory(() => WishListRepo(sl<ApisService>()));
  sl.registerFactory(() => Profilerepo(sl<ApisService>()));
  sl.registerFactory(() => StoreRepo(sl<ApisService>()));
  sl.registerLazySingleton(() => FollowStoreRepo(sl<ApisService>()));
  sl.registerFactory(() => SearchProductRepo(sl<ApisService>()));
  sl.registerFactory(() => BagRepo(sl<ApisService>()));
  sl.registerFactory(() => FilterRepo(sl<ApisService>()));

  // sl.registerFactory(() => RegisterCubit(sl<RegisterRepo>()));

  sl.registerFactory<RegisterCubit>(
      () => RegisterCubit(sl<RegisterRepo>()));
  // sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepo>()));
  sl.registerFactory<CategoryCubit>(
      () => CategoryCubit(sl<CategoryRepo>()));
  sl.registerFactory<WishListCubit>(
      () => WishListCubit(sl<WishListRepo>()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<Profilerepo>()));
  sl.registerFactory<StoreProductsCubit>(
      () => StoreProductsCubit(sl<StoreRepo>()));
  sl.registerLazySingleton<FollowStoreCubit>(
      () => FollowStoreCubit(sl<FollowStoreRepo>()));

  sl.registerFactory<SearchCubit>(() => SearchCubit(sl<SearchProductRepo>()));
  sl.registerFactory<StoreDetailsCubit>(() => StoreDetailsCubit(sl<StoreRepo>()));
  sl.registerFactory<BagCubit>(() => BagCubit(sl<BagRepo>()));

  sl.registerFactory<CategoryProductCubit>(() => CategoryProductCubit(sl<CategoryRepo>()));

  sl.registerFactory<FilterCubit>(() => FilterCubit(sl<FilterRepo>()));


}
