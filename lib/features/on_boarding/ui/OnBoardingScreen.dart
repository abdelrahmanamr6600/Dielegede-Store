
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/const.dart';
import 'package:dielegende_store/features/on_boarding/data/OnBoardingModel.dart';
import 'package:dielegende_store/features/on_boarding/ui/widgets/NavigationButtonWidget.dart';
import 'package:dielegende_store/features/on_boarding/ui/widgets/OnBoardingPage.dart';
import 'package:dielegende_store/features/on_boarding/ui/widgets/SkipButtonWidget.dart';
import 'package:flutter/material.dart';
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
          SkipButtonWidget(onSkip: onSkip),
          NavigationButtonsWidget(
            currentPage: currentPage,
            totalPages: onboardingData.length,
            onNext: onNext,
            onPrevious: onPrevious,
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
