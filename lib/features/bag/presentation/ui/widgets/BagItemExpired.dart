import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/CustomDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExpiredBagProductItem extends StatelessWidget {
  final ExpiredItem bagItem;
  final VoidCallback onDelete;

  const ExpiredBagProductItem(
      {super.key, required this.bagItem, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    "assets/images/hoody.png",
                    width: 105.w,
                    height: 105.h,
                    fit: BoxFit.fitHeight,
                    color: Colors.white.withOpacity(0.5),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bagItem.product.name,
                        style: AppTextStyles.mainText().copyWith(
                          fontSize: 12.sp,
                          color: greyColor.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Shirt",
                        style: AppTextStyles.mainText().copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFF222222).withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            "Color: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            bagItem.selectedOptions.color,
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF222222).withOpacity(0.5),
                            ),
                          ),
                          SizedBox(width: 18.w),
                          Text(
                            "Size: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            bagItem.selectedOptions.size,
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF222222).withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bagItem.product.price.toString(),
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(width: 40.w),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star,
                                    color: Colors.amber.withOpacity(0.5),
                                    size: 14.w),
                                Icon(Icons.star,
                                    color: Colors.amber.withOpacity(0.5),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber.withOpacity(0.5),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber.withOpacity(0.5),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber.withOpacity(0.5),
                                    size: 14.sp),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    '(10)',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.close, color: darkGreyColor, size: 20.sp),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            action: onDelete,
                            headerMessage: "Remove Product?",
                            bodyMessage:
                                "Are you sure you want to remove this product from your bag?",
                            buttonText: "Remove",
                          );
                        },
                      );
                      
                    }),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
