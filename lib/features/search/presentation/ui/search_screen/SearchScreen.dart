import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/ProductGridView.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        "image": "assets/images/t-shirt.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
      {
        "image": "assets/images/hoody.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
      {
        "image": "assets/images/t-shirt.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
      {
        "image": "assets/images/hoody.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
      {
        "image": "assets/images/t-shirt.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
      {
        "image": "assets/images/hoody.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "rating": 4.9,
        "desc": "It's a long established fact...",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Search",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Row(
                children: [
                  const Expanded(child: SearchWidget()),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0XFFF0F2F1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(
                          AssetsData.filter,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProductGridView(products: products),
          ],
        ),
      ),
    );
  }
}
