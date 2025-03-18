import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const LabeledTextField({
    required this.text,
    super.key,  this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style ?? AppTextStyles.smallText
            .copyWith(color: greyColor, fontWeight: FontWeight.w600));
  }
}
