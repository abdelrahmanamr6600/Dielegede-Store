import 'package:dielegende_store/core/shared/widgets/HomeAppBar.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/CategorySection.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeProduct.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/SliderBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const SafeArea(child: HomeAppBar()),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            SliderBanner(),
            SizedBox(height: 10.h),
            CategorySection(),
            const HomeProduct()
          ],
        ),
      ),
    );
  }
}
