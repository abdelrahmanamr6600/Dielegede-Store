import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget{

  final VoidCallback onPressed;
  final Color color;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text , required this.color});
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 5.w
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.buttonText
      ),
    );
  }
}
