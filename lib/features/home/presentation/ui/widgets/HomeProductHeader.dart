import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeProductHeader extends StatelessWidget {
  const HomeProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Products",
              style: AppTextStyles.mainText().copyWith(
                color: const Color(0xFF393F42),
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => context.push('/filtersScreen'),
              child: Row(
                children: [
                  Text(
                    "Filters",
                    style: AppTextStyles.smallText().copyWith(
                      color: const Color(0xFF393F42),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SvgPicture.asset(
                    AssetsData.filter,
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
