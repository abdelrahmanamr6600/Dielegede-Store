import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/ProductGridView.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/features/search/presentation/ui/widgets/ProductItemSearch.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SearchWidget(),
            SizedBox(height: 12.h),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ProductItemSearch(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
