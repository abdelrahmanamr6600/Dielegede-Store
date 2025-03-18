import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/navigation/presentation/cubit/BottomNavigationCubit.dart';
import 'package:dielegende_store/features/navigation/presentation/ui/widgets/BottomNavBarItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) =>
                context.read<BottomNavigationCubit>().changeTab(index),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: mainColor,
            unselectedItemColor: greyColor,
            selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.inter().fontFamily,
                color: mainColor),
            unselectedLabelStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
                color: greyColor),
            enableFeedback: false,
            items: [
              bottomNavigationBarItem(AssetsData.homeActivated, AssetsData.home,
                  "Home", currentIndex == 0),
              bottomNavigationBarItem(AssetsData.searchActivated,
                  AssetsData.search, "Search", currentIndex == 1),
              bottomNavigationBarItem(AssetsData.bagActivated, AssetsData.bag,
                  "Bag", currentIndex == 2),
              bottomNavigationBarItem(AssetsData.heartActivated,
                  AssetsData.heart, "Favorites", currentIndex == 3),
              bottomNavigationBarItem(AssetsData.profileActivated,
                  AssetsData.profile, "Profile", currentIndex == 4),
            ],
          ),
        ),
      ),
    );
  }
}
