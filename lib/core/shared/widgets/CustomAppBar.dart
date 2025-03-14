import 'package:dielegende_store/core/utils/app_router.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          } else {
            print("there is no previous to pop");
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: const Color(0XFFE8ECF4), width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 14.h),
              child: SvgPicture.asset(
                'assets/images/arrow.svg',
                width: 5.w,
                height: 5.h,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
