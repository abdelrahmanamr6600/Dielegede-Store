import 'package:carousel_slider/carousel_slider.dart';
import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderBanner extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

   SliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: bannerImages.map((images) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              images,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        }).toList(),
        options: CarouselOptions(
            height: 150.h,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9));
  }
}
