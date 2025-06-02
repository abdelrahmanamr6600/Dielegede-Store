import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptySearchResultWidget extends StatelessWidget {
  final String message;
  final String lottiePath;
  final Color? color;

  const EmptySearchResultWidget({
    super.key,
    this.message = "No Products Found",
    this.lottiePath = "assets/images/search_lotti.json",
    this.color = const Color(0xFF47BCE5),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              lottiePath,
              height: 180,
              repeat: true,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
