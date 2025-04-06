import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/category/presentation/ui/widgets/CategoryItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0.h),
              child: CategoryItem(
                  image: "assets/images/category_c.png",
                  text: "New collection",
                  alignment: Alignment.bottomRight),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.22,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'Summer sale',
                            style: AppTextStyles.largeText.copyWith(
                                fontSize: 34.sp,
                                fontWeight: FontWeight.w700,
                                color: mainColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: CategoryItem(
                          image: "assets/images/category_w.png",
                          alignment: Alignment.bottomLeft),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CategoryItem(
                    image: "assets/images/category_m.png",
                    text: " Men’s hoodies",
                    alignment: Alignment.center),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
