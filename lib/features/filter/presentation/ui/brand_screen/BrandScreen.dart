import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/filter/presentation/ui/widgets/ActionButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandSelectionScreen extends StatefulWidget {
  const BrandSelectionScreen({super.key});

  @override
  State<BrandSelectionScreen> createState() => _BrandSelectionScreenState();
}

class _BrandSelectionScreenState extends State<BrandSelectionScreen> {
  List<String> brands = [
    "adidas",
    "adidas Originals",
    "Blend",
    "Boutique Moschino",
    "Champion",
    "Diesel",
    "Jack & Jones",
    "Naf Naf",
    "Red Valentino",
    "s.Oliver"
  ];

  List<String> selectedBrands = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Brand"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const SearchWidget(color: Colors.white),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    String brand = brands[index];
                    bool isSelected = selectedBrands.contains(brand);
                    return CheckboxListTile(
                      title: Text(
                        brand,
                        style: AppTextStyles.largeText.copyWith(
                          color: isSelected ? mainColor : blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      activeColor: mainColor,
                      side: const BorderSide(color: greyColor, width: 2),
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedBrands.add(brand);
                          } else {
                            selectedBrands.remove(brand);
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: ActionButtonsWidget(
                  onDiscard: () {},
                  onApply: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
