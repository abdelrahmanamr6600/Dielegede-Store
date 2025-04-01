import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/ActionButtonWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/BrandSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/CategorySelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/ColorSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/PriceRangeWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/RatingSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/SizeSelectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double minPrice = 75;
  double maxPrice = 150;
  Color selectedColor = const Color(0xFFF5E3DF);
  String selectedSize = "S";
  String selectedCategory = "All";
  int selectedRating = 5;
  int startIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Filters"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              PriceRangeWidget(
                minPrice: minPrice,
                maxPrice: maxPrice,
                onPriceChanged: (values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
              ),
              SizedBox(height: 20.h),
              ColorSelectionWidget(
                colors: const [
                  Color(0xFFF5E3DF),
                  Color(0xFF000000),
                  Color(0xFFE4F2DF),
                  Color(0xFFD5E0ED),
                  Color(0xFFECECEC),
                  Color(0xFF151867),
                ],
                selectedColor: selectedColor,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              SizedBox(height: 20.h),
              SizeSelectionWidget(
                sizes: const ["Xs", "S", "M", "L", "XL"],
                selectedSize: selectedSize,
                onSizeSelected: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CategorySelectionWidget(
                categories: const ["All", "Women", "Men", "Boys", "Girls"],
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              RatingSelectionWidget(
                selectedRating: selectedRating,
                onRatingSelected: (rating) {
                  setState(() {
                    selectedRating = rating;
                  });
                },
              ),
              SizedBox(height: 20.h),
              BrandSelectionWidget(
                title: "Brand",
                brands: "adidas Originals, Jack & Jones, s.Oliver",
                onTap: () {},
              ),
              SizedBox(height: 20.h),
              ActionButtonsWidget(
                onDiscard: () {},
                onApply: () {},
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ));
  }
}
