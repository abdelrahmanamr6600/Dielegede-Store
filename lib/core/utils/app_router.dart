import 'package:dielegende_store/features/forget_password/presentation/ui/screens/ForgetPasswordScreen.dart';
import 'package:dielegende_store/features/forget_password/presentation/ui/screens/OtpVerificationEmailScreen.dart';
import 'package:dielegende_store/features/forget_password/presentation/ui/screens/ResetPasswordScreen.dart';
import 'package:dielegende_store/features/home/presentation/ui/home_screen/HomeScreen.dart';
import 'package:dielegende_store/features/login/presentation/ui/login_screen/LoginScreen.dart';
import 'package:dielegende_store/features/navigation/presentation/ui/navigation_screen/NavigationScreen.dart';
import 'package:dielegende_store/features/on_boarding/ui/OnBoardingScreen.dart';
import 'package:dielegende_store/features/register/presentation/ui/otp_screen/OtpScreen.dart';
import 'package:dielegende_store/features/register/presentation/ui/register_screen/RegisterScreen.dart';
import 'package:dielegende_store/features/welcome/ui/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => OtpScreen(),
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (context, state) => ForgetPasswordScreen(),
    ),
    GoRoute(
      path: '/otpVerification',
      builder: (context, state) => OtpVerificationEmailScreen(),
    ),
    GoRoute(
      path: '/resetPassword',
      builder: (context, state) => ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/homeScreen',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
        path: '/navigationScreen',
        builder: (context, state) => NavigationScreen()),
  ],
);
