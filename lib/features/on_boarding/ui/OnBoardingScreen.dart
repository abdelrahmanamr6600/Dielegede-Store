import 'package:dielegende_store/core/utils/app_router.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/const.dart';
import 'package:dielegende_store/features/on_boarding/data/OnBoardingModel.dart';
import 'package:dielegende_store/features/on_boarding/ui/widgets/OnBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnBoardingModel> onboardingData = [
    OnBoardingModel(
        image: AssetsData.imageOnBoarding1,
        title: onBoardingTitle1,
        description: onBoardingDesc1),
    OnBoardingModel(
        image: AssetsData.imageOnBboarding2,
        title: onBoardingTitle2,
        description: onBoardingDesc2),
    OnBoardingModel(
        image: AssetsData.imageOnBboarding3,
        title: onBoardingTitle1,
        description: onBoardingDesc3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final page = onboardingData[index];
                return OnboardingPage(
                  image: page.image,
                  title: page.title,
                  description: page.description,
                  currentPage: currentPage,
                  totalPages: onboardingData.length,
                );
              }),
          Positioned(
            top: 50.h,
            right: 16.w,
            child: GestureDetector(
              onTap: onSkip,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                decoration: BoxDecoration(
                  border: Border.all(color: darkColor),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage > 0)
                  ElevatedButton(
                    onPressed: onPrevious,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: mainColor,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: mainColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Text("Back",
                        style: AppTextStyles.mainText.copyWith(
                            color: mainColor, fontWeight: FontWeight.w400)),
                  )
                else
                  SizedBox(width: 60.w),
                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Text(
                      currentPage == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: AppTextStyles.mainText.copyWith(
                        fontWeight: FontWeight.w600,
                        
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onNext() {
    if (currentPage < onboardingData.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      context.go("/welcome");
    }
  }

  void onPrevious() {
    if (currentPage > 0) {
      _pageController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void onSkip() {
    context.go("/welcome");
  }
}
