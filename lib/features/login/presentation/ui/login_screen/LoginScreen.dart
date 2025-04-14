import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/shared/widgets/CustomSnackbar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginCubit.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginState.dart';
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
        create: (BuildContext context) => sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listener: (BuildContext context, state) {
          if (state is LoginSuccess) {
            SecureStorageHelper.saveToken(state.response.token);
            context.push('/navigationScreen');
          } else if (state is LoginFailure) {
            showCustomSnackBar(context, state.message);
          }          
        }, builder: (BuildContext context, state) {
          return Scaffold(
              appBar: const CustomAppBar(),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.0.w,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.png'),
                          SizedBox(height: 20.h),
                          Text("Welcome Back!",
                              style: AppTextStyles.largeText()
                                  .copyWith(fontSize: 24.sp, color: darkColor)),
                          Text("Glade to see you, again!",
                              style: AppTextStyles.smallText().copyWith(
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
                                    validation: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
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
                                        BlocProvider.of<LoginCubit>(context)
                                            .isPassword,
                                    suffix: BlocProvider.of<LoginCubit>(context)
                                        .suffix,
                                    suffixFun: () {
                                      BlocProvider.of<LoginCubit>(context)
                                          .changePasswordVisibility();
                                    },
                                    validation: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
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
                              state is LoginLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: mainColor,
                                      ),
                                    )
                                  : CustomButton(
                                      onPressed: () {
                                        final data = {
                                          "email": emailController.text,
                                          "password": passwordController.text
                                        };
                                        if (formKey.currentState!.validate()) {
                                          BlocProvider.of<LoginCubit>(context)
                                              .userLogin(data);
                                        }
                                      },
                                      text: "Login",
                                      color: darkColor),
                            ],
                          ),
                        ]),
                  ),
                ),
              ));
        }));
  }
}
