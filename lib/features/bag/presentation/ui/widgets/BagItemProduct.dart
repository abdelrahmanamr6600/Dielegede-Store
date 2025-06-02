import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/CustomDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BagProductItem extends StatelessWidget {
  final BagItem bagItem;
  final VoidCallback onDelete;

  const BagProductItem(
      {super.key, required this.bagItem, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final expiryTime = bagItem.expiresAt;
    final remaining = expiryTime.difference(now);

    final hours = remaining.inHours;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

    final isExpired = remaining.isNegative;
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
                          color: greyColor.withOpacity(1),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            "Color: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(1),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              bagItem.selectedOptions.color.isNotEmpty
                                  ? bagItem.selectedOptions.color
                                  : "Black", 
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.mainText().copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF222222).withOpacity(1),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Text(
                            "Size: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(1),
                            ),
                          ),
                          Text(
                            bagItem.selectedOptions.size.isNotEmpty
                                ? bagItem.selectedOptions.size
                                : "M", 
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF222222).withOpacity(1),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${bagItem.product.price} SAR ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50.w),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(Icons.close,
                            color: greyColor.withOpacity(0.6), size: 20.sp),
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
                    const Spacer(),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: const BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(AssetsData.timer),
                          Text(
                            isExpired ? "Expired" : "$hours h : $minutes m",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
