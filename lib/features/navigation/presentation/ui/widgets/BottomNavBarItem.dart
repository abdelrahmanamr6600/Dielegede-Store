import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    String selectedIcon, String unSelectedIcon ,  String label, bool isActive) {
  return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: (isActive
            ? (Matrix4.identity()..scale(1.05)) 
            : (Matrix4.identity()..scale(1.0))),
        child: SvgPicture.asset(
          isActive ? selectedIcon : unSelectedIcon,
          width: 28.w,
          height: 28.h,
          colorFilter: ColorFilter.mode(
              isActive ? mainColor : greyColor, BlendMode.srcIn),
        ),
      ),
      label: label
      );
}
