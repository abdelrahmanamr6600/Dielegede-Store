import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryProductCubit.dart';
import 'package:dielegende_store/features/category/presentation/ui/category_product_screen/CategoryProductScreen.dart';
import 'package:dielegende_store/features/category/presentation/ui/category_screen/CategoryScreen.dart';
import 'package:dielegende_store/features/filter/presentation/ui/display_filter_products/FilterProductsScreen.dart';
import 'package:dielegende_store/features/filter/presentation/ui/filter_screen/FilterScreen.dart';
import 'package:dielegende_store/features/filter/presentation/ui/brand_screen/BrandScreen.dart';
import 'package:dielegende_store/features/follow_store/presentation/ui/get_followed_screen/GetFollowedScreen.dart';
import 'package:dielegende_store/features/forget_password/presentation/ui/screens/ForgetPasswordScreen.dart';
import 'package:dielegende_store/features/forget_password/presentation/ui/screens/OtpVerificationEmailScreen.dart';
import 'package:dielegende_store/features/forget_password/presentation/ui/screens/ResetPasswordScreen.dart';
import 'package:dielegende_store/features/home/data/repo/HomeRepo.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/loading_screen/LoadingScreen.dart';
import 'package:dielegende_store/features/login/data/repo/LoginRepo.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginCubit.dart';
import 'package:dielegende_store/features/login/presentation/ui/login_screen/LoginScreen.dart';
import 'package:dielegende_store/features/navigation/presentation/cubit/BottomNavigationCubit.dart';
import 'package:dielegende_store/features/navigation/presentation/ui/navigation_screen/NavigationScreen.dart';
import 'package:dielegende_store/features/notification_screen/NotificationScreen.dart';
import 'package:dielegende_store/features/on_boarding/ui/OnBoardingScreen.dart';
import 'package:dielegende_store/features/privacy_policy/presentation/ui/PrivacyPolicyScreen.dart';
import 'package:dielegende_store/features/product_details/presentation/ui/product_details_screen/ProductDetailsScreen.dart';
import 'package:dielegende_store/features/profile/presentation/ui/edit_profile_screen/EditProfileScreen.dart';
import 'package:dielegende_store/features/profile/presentation/ui/profile_screen/ProfileScreen.dart';
import 'package:dielegende_store/features/register/presentation/ui/otp_screen/OtpScreen.dart';
import 'package:dielegende_store/features/register/presentation/ui/register_screen/RegisterScreen.dart';
import 'package:dielegende_store/features/store/presentation/ui/all_stores_screen/AllStoresScreen.dart';
import 'package:dielegende_store/features/store/presentation/ui/nearby_stores_screen/NearbyStoresScreen.dart';
import 'package:dielegende_store/features/store/presentation/ui/storedetails_screen/StroreDetailsScreen.dart';
import 'package:dielegende_store/features/store_location/StoreLocationScreen.dart';
import 'package:dielegende_store/features/welcome/ui/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(sl<LoginRepo>()),
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (context, state) => ForgetPasswordScreen(),
    ),
    GoRoute(
      path: '/otpVerification',
      builder: (context, state) => OtpVerificationEmailScreen(),
    ),
    GoRoute(
      path: '/resetPassword',
      builder: (context, state) => ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/homeScreen',
      builder: (context, state) => BlocProvider(
        create: (_) => HomeCubit(sl<HomeRepo>()),
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/navigationScreen',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<BottomNavigationCubit>(),
        child: NavigationScreen(),
      ),
    ),
    GoRoute(
        path: '/productDetailsScreen',
        builder: (context, state) => const ProductDetailsScreen()),
    GoRoute(
        path: '/filtersScreen',
        builder: (context, state) => const FilterScreen()),
    GoRoute(
        path: '/brandScreen',
        builder: (context, state) => const BrandSelectionScreen()),
    GoRoute(
      path: '/categoryScreen',
      builder: (context, state) {
        return const CategoryScreen();
      },
    ),
    GoRoute(
      path: '/notificationScreen',
      builder: (context, state) {
        return const NotificationScreen();
      },
    ),
    GoRoute(
        path: '/editProfileScreen',
        builder: (context, state) => EditProfileScreen()),
    GoRoute(
        path: '/profileScreen',
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: '/privacyPolicyScreen',
        builder: (context, state) => const PrivacyPolicyScreen()),
    GoRoute(
      path: '/StoreDetailsScreen',
      builder: (context, state) {
        final storeId = state.extra as int;
        return StoreDetailsScreen(storeId: storeId);
      },
    ),
    GoRoute(
        path: '/AllStoresScreen',
        builder: (context, state) => const AllStoresScreen()),
    GoRoute(
        path: '/FollowedStoresScreen',
        builder: (context, state) => const FollowedStoreScreen()),
    GoRoute(
        path: '/StoreLocationScreen',
        builder: (context, state) => const StoreLocationScreen()),
    GoRoute(
      path: '/categoryProductScreen',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final categoryId = data['id'] as int;
        final categoryName = data['name'] as String;

        return Builder(
          builder: (context) {
            return BlocProvider(
              create: (_) {
                final cubit = sl<CategoryProductCubit>();
                cubit.getCategoryProduct(categoryId);
                return cubit;
              },
              child: CategoruProductScreen(
                categoryProductId: categoryId,
                categoryName: categoryName,
              ),
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/nearby-stores',
      name: 'nearbyStores',
      pageBuilder: (context, state) {
        final data = state.extra! as Map<String, dynamic>;

        return MaterialPage(
          child: NearbyStoresMapScreen(
            userLat: data['userLat'],
            userLng: data['userLng'],
            nearbyStores: data['stores'],
          ),
        );
      },
    ),
    GoRoute(
        path: '/filteredProductsScreen',
        builder: (context, state) => FilteredProductsScreen()),
  ],
);
