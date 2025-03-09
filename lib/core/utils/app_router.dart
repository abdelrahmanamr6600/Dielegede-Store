
import 'package:dielegende_store/features/login/presentation/ui/login_screen/LoginScreen.dart';
import 'package:dielegende_store/features/on_boarding/ui/OnBoardingScreen.dart';
import 'package:dielegende_store/features/register/presentation/ui/register_screen/RegisterScreen.dart';
import 'package:dielegende_store/features/welcome/ui/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
     GoRoute(
      path: '/onboarding',
      builder: (context, state) =>  const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
     GoRoute(
      path: '/register',
      builder: (context, state) =>  RegisterScreen(),
    ),
   
     GoRoute(
      path: '/login',
      builder: (context, state) =>  const LoginScreen(),
    ),

  ],
);
