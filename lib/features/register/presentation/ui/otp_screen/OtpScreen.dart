import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Image.asset(
                AssetsData.logo,
                height: 100.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('Enter Code',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: darkColor)),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                        text:
                            'We’ve sent an SMS with an activation code to your phone',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: greyColor),
                        children: [
                          TextSpan(
                              text: " +33 2 94 27 84 11",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.inter().fontFamily,
                                color: darkColor,
                              ))
                        ]),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Pinput(
                controller: otpController,
                errorText: "error, send again",
                length: 6,
                onChanged: (value) {
                  setState(() {
                    isError = false;
                  });
                },
                defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: darkColor),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: isError ? Colors.red : darkColor),
                        borderRadius: BorderRadius.circular(10.r))),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (isError)
                Text(
                  "wrong code , plz try again",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: errorColor),
                ),
              SizedBox(
                height: 15.h,
              ),
              Text.rich(
                TextSpan(
                    text: 'I didn’t receive a code',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: greyColor),
                    children: [
                      TextSpan(
                          text: " Resend",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: darkColor,
                          ))
                    ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  onPressed: () {
                    if (otpController.text != "123456") {
                      setState(() {
                        isError = true;
                      });
                    } else {
                    }
                  },
                  text: "Verify",
                  color: darkColor)
            ],
          ),
        ),
      ),
    );
  }
}
