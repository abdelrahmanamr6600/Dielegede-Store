import 'package:dielegende_store/core/utils/app_router.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title ?? '',
        style: AppTextStyles.largeText.copyWith(
            color: const Color(0xFF393F42), fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          } else {
            print("there is no previous to pop");
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.h),
          child: SvgPicture.asset(
            AssetsData.arrowLeft,
            width: 5.w,
            height: 5.h,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
