import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/bag/presentation/ui/bag_screen/BagScreen.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/home/presentation/ui/home_screen/HomeScreen.dart';
import 'package:dielegende_store/features/navigation/presentation/cubit/BottomNavigationCubit.dart';
import 'package:dielegende_store/features/navigation/presentation/ui/widgets/BottomNavBar.dart';
import 'package:dielegende_store/features/profile/presentation/ui/profile_screen/ProfileScreen.dart';
import 'package:dielegende_store/features/search/presentation/ui/search_screen/SearchScreen.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/ui/wish_list_screen/WishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final List<Widget> pages = [
     const HomeScreen(),
    const SearchScreen(),
    const BagScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(create: (_) => sl<HomeCubit>()),
        // BlocProvider(create: (_) => sl<StoreProductsCubit>()),
        // BlocProvider(create: (_) => sl<CategoryCubit>()),
        BlocProvider(create: (_) => sl<WishListCubit>()),
      ],
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: pages[state],
            bottomNavigationBar: BottomNavBar(
              currentIndex: state,
            ),
          );
        },
      ),
    );
  }
}
