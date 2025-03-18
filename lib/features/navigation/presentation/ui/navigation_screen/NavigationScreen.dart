import 'package:dielegende_store/features/bag/presentation/ui/bag_screen/BagScreen.dart';
import 'package:dielegende_store/features/home/presentation/ui/home_screen/HomeScreen.dart';
import 'package:dielegende_store/features/navigation/presentation/cubit/BottomNavigationCubit.dart';
import 'package:dielegende_store/features/navigation/presentation/ui/widgets/BottomNavBar.dart';
import 'package:dielegende_store/features/profile/presentation/ui/profile_screen/ProfileScreen.dart';
import 'package:dielegende_store/features/search/presentation/ui/search_screen/SearchScreen.dart';
import 'package:dielegende_store/features/wish_list/presentation/ui/wish_list_screen/WishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final List<Widget> pages = [
    HomeScreen(),
    const SearchScreen(),
    BagScreen(),
    WishListScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
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
