import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterState.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/LabeledTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return Scaffold(
                  appBar: const CustomAppBar(),
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.0.w,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png'),
                            SizedBox(height: 20.h),
                            Text("Welcome Back!",
                                style: AppTextStyles.largeText.copyWith(
                                    fontSize: 24.sp, color: darkColor)),
                            Text("Glade to see you, again!",
                                style: AppTextStyles.smallText.copyWith(
                                    color: greyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp)),
                            SizedBox(height: 30.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LabeledTextField(text: "Email"),
                                    SizedBox(height: 5.h),
                                    CustomTextFormField(
                                      icon: const Icon(Icons.email,
                                          color: Colors.black),
                                      labelText: "Email",
                                      controller: emailController,
                                      inputType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LabeledTextField(text: "Password"),
                                    SizedBox(height: 5.h),
                                    CustomTextFormField(
                                      icon: const Icon(Icons.lock,
                                          color: Colors.black),
                                      controller: passwordController,
                                      inputType: TextInputType.text,
                                      isPassword:
                                          BlocProvider.of<RegisterCubit>(
                                                  context)
                                              .isPassword,
                                      suffix: BlocProvider.of<RegisterCubit>(
                                              context)
                                          .suffix,
                                      suffixFun: () {
                                        BlocProvider.of<RegisterCubit>(context)
                                            .changePasswordVisibility();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                              Colors.transparent)),
                                      onPressed: () {
                                        context.push('/forgetPassword');
                                      },
                                      child: Text(
                                        "Forgot passsword?",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: darkGreyColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Dont't have an account?",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xFF1E232C)),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                          overlayColor: WidgetStateProperty.all(
                                              Colors.transparent)),
                                      onPressed: () {
                                        context.push('/register');
                                      },
                                      child: Text(
                                        "Register Now",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: mainColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomButton(
                                    onPressed: () {
                                      context.push('/homescreen');
                                    },
                                    text: "Login",
                                    color: darkColor),
                              ],
                            ),
                          ]),
                    ),
                  ));
            }));
  }
}
