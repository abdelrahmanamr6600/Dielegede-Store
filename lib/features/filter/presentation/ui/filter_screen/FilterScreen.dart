import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProductCubit.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/ActionButtonWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/BrandSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/CategorySelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/ColorSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/PriceRangeWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/RatingSelectionWidget.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/SizeSelectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double minPrice = 75;
  double maxPrice = 150;
  List<Color> selectedColors = [];
  List<String> selectedSizes = [];
  String selectedCategory = "All";
  int selectedRating = 5;
  int startIndex = 0;

  List<String> getSelectedColorStrings() {
    Map<Color, String> colorNameMap = {
      const Color(0xFFF5E3DF): 'beige',
      const Color(0xFF000000): 'black',
      const Color(0xFFE4F2DF): 'lightgreen',
      const Color(0xFFD5E0ED): 'lightblue',
      const Color(0xFFECECEC): 'lightgray',
      const Color(0xFF151867): 'darkblue',
    };

    return selectedColors
        .map((color) => colorNameMap[color] ?? 'unknown')
        .toList();
  }

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
                selectedColors: selectedColors,
                onColorSelected: (color) {
                  setState(() {
                    if (selectedColors.contains(color)) {
                      selectedColors.remove(color);
                    } else {
                      selectedColors.add(color);
                    }
                  });
                },
              ),
              SizedBox(height: 20.h),
              SizeSelectionWidget(
                sizes: const ["XS", "S", "M", "L", "XL"],
                selectedSizes: selectedSizes,
                onSizeSelected: (size) {
                  setState(() {
                    if (selectedSizes.contains(size)) {
                      selectedSizes.remove(size);
                    } else {
                      selectedSizes.add(size);
                    }
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
              // BrandSelectionWidget(
              //   title: "Brand",
              //   brands: "adidas Originals, Jack & Jones, s.Oliver",
              //   onTap: () {
              //     context.push('/brandScreen');
              //   },
              // ),
              // SizedBox(height: 20.h),
              ActionButtonsWidget(
                onDiscard: () {
                  // reset filters logic if needed
                },
                onApply: () {
                  context.read<FilterCubit>().getFilteredProducts(
                        minPrice: minPrice,
                        maxPrice: maxPrice,
                        selectedColors: selectedColors
                            .map((color) =>
                                '#${color.value.toRadixString(16).padLeft(8, '0')}')
                            .toList(),
                        selectedSizes: selectedSizes,
                      );

                  context.push('/filteredProductsScreen');
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ));
  }
}
