import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsItem extends StatefulWidget {
  const ProductDetailsItem({super.key});

  @override
  State<ProductDetailsItem> createState() => _ProductDetailsItemState();
}

class _ProductDetailsItemState extends State<ProductDetailsItem> {
  String selectedSize = "S";
  Color selectedColor = Colors.black;

  List<String> images = [
    "assets/images/kids.png",
    "assets/images/men.png",
    "assets/images/women.png"
  ];

  String selectedImage = "assets/images/kids.png";
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              selectedImage,
              width: 375.w,
              height: 300.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((image) {
                bool isSelected = selectedImage == image;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                            decoration: BoxDecoration(
                                border: isSelected
                                    ? Border.all(
                                        color: mainColor,
                                        width: 1.5.w,
                                      )
                                    : null),
                            child: Image.asset(
                              image,
                              width: 72.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ))),
                  ),
                );
              }).toList()),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "H&m",
                      style: AppTextStyles.largeText.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF222222)),
                    ),
                    const Spacer(),
                    Text(
                      "19.99\$",
                      style: AppTextStyles.largeText.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF222222)),
                    ),
                  ],
                ),
                Text("Short black dress",
                    style: AppTextStyles.smallText
                        .copyWith(fontSize: 11.sp, color: greyColor)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14.w),
                    Icon(Icons.star, color: Colors.orange, size: 14.w),
                    Icon(Icons.star, color: Colors.orange, size: 14.w),
                    Icon(Icons.star, color: Colors.orange, size: 14.w),
                    Icon(Icons.star_half, color: Colors.orange, size: 14.w),
                    SizedBox(width: 4.w),
                    Text("(100)",
                        style: AppTextStyles.smallText
                            .copyWith(fontSize: 10.sp, color: greyColor)),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(children: [
                  SvgPicture.asset("assets/icons/location.svg",
                      width: 20.w, height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jawa Timur",
                        style: AppTextStyles.smallText.copyWith(
                            fontSize: 12.sp, color: const Color(0xFF000007)),
                      ),
                      Text(
                        "Indonesia Jawa Timur, Indonesia",
                        style: AppTextStyles.smallText.copyWith(
                            fontSize: 12.sp,
                            color: const Color(0xFF61646B).withOpacity(0.8)),
                      )
                    ],
                  )
                ]),
                SizedBox(height: 14.h),
                Text("Product Details",
                    style: AppTextStyles.largeText.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Text(
                    "Short dress in soft cotton jersey with decorative buttons down the front and a wide,/ frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                    style: AppTextStyles.mainText.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: darkGreyColor,
                    )),
                SizedBox(height: 14.h),
                Text("Select Size",
                    style: AppTextStyles.largeText.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
                SizedBox(height: 14.h),
                Row(
                  children: ["S", "M", "L", "XL"].map((size) {
                    bool isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            color: isSelected ? mainColor : Colors.white,
                            border:
                                Border.all(color: borderColor.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            size,
                            style: AppTextStyles.mainText.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          )),
                    );
                  }).toList(),
                ),
                SizedBox(height: 14.h),
                Text("Select Color",
                    style: AppTextStyles.largeText.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    const Color(0xFFF5E3DF),
                    const Color(0xFF000000),
                    const Color(0xFFE4F2DF),
                    const Color(0xFFD5E0ED),
                    const Color(0xFFECECEC),
                  ].map((color) {
                    bool isSelected = selectedColor == color;
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 16.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? mainColor : Colors.white,
                              border: isSelected
                                  ? Border.all(color: mainColor, width: 1.5)
                                  : Border.all(color: Colors.transparent),
                            ),
                            child: CircleAvatar(
                                radius: 14.w, backgroundColor: color)));
                  }).toList(),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  onPressed: () {},
                  text: "Book in bag",
                  color: mainColor,
                  redius: 25.r,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
