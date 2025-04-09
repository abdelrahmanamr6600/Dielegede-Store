import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/LabeledTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reset password",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Please type something you’ll remember",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: darkColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledTextField(
                      text: "New Password",
                      style: TextStyle(
                          color: darkColor,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextFormField(
                      hintText: "must be 8 characters",
                      controller: passwordController,
                      inputType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledTextField(
                      text: "Confirm new password",
                      style: TextStyle(
                          color: darkColor,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextFormField(
                      hintText: "repeat password",
                      controller: passwordController,
                      inputType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                    onPressed: () {}, text: "Reset password", color: darkColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
