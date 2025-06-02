import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

   Future<void> _navigate() async {
    final token = await SecureStorageHelper.getToken();

    if (!mounted) return; 

    if (token != null && token.isNotEmpty) {
      context.go('/navigationScreen');
    } else {
      context.go('/onboarding');
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(
        color: mainColor,
      )),
    );
  }
}
