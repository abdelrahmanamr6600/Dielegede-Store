import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback onDiscard;
  final VoidCallback onApply;


  const ActionButtonsWidget({
    super.key,
    required this.onDiscard,
    required this.onApply,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: onDiscard,
                width: 160.w,
                height: 36.h,
                text: "Discard",
                textColor: darkColor,
                redius: 25.r,
                borderColor: darkColor,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: CustomButton(
                onPressed: onApply,
                width: 160.w,
                height: 36.h,
                text: "Apply",
                redius: 25.r,
                color: mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
