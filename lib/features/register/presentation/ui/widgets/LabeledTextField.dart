import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String text;
  const LabeledTextField({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppTextStyles.subHeadline
            .copyWith(color: greyColor, fontWeight: FontWeight.w500));
  }
}
