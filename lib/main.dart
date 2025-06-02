import 'package:dielegende_store/core/utils/app_router.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProductCubit.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileCubit.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreDetailsCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: mainColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishListCubit>(create: (context) => sl<WishListCubit>()),
        BlocProvider<StoreProductsCubit>(
            create: (context) => sl<StoreProductsCubit>()),
        BlocProvider<CategoryCubit>(create: (context) => sl<CategoryCubit>()),
        BlocProvider<FollowStoreCubit>(
            create: (context) => sl<FollowStoreCubit>()),
        BlocProvider<StoreDetailsCubit>(
            create: (context) => sl<StoreDetailsCubit>()),
        BlocProvider<FilterCubit>(create: (context) => sl<FilterCubit>()),
        BlocProvider<BagCubit>(create: (context) => sl<BagCubit>()),
        BlocProvider<ProfileCubit>(
          create: (context) => sl<ProfileCubit>()..getProfile(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 800),
        child: MaterialApp.router(
          locale: const Locale(
            'en',
          ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
