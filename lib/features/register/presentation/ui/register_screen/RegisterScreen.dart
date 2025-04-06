import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterState.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/DatePickerWidget.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/GenderDropDownWidget.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/LabeledTextField.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/PhoneNumberFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String selectedGender = 'Male';

  RegisterScreen({super.key});

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
                      horizontal: 8.0.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png'),
                        SizedBox(height: 20.h),
                        Text("Hello!",
                            style: AppTextStyles.largeText
                                .copyWith(fontSize: 24.sp, color: darkColor)),
                        Text("Register to get started",
                            style: AppTextStyles.smallText.copyWith(
                                color: greyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp)),
                        SizedBox(height: 30.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Full Name"),
                            SizedBox(height: 5.h),
                            CustomTextFormField(
                              icon:
                                  const Icon(Icons.person, color: Colors.black),
                              controller: nameController,
                              inputType: TextInputType.text,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Birh Of Date"),
                            SizedBox(height: 5.h),
                            buildDatePicker(dateController, context),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Gender"),
                            SizedBox(height: 5.h),
                            buildGenderDropdown(selectedGender),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Phone Number"),
                            SizedBox(height: 5.h),
                            buildPhoneNumberField(phoneController),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Email"),
                            SizedBox(height: 5.h),
                            CustomTextFormField(
                              icon:
                                  const Icon(Icons.email, color: Colors.black),
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
                              icon: const Icon(Icons.lock, color: Colors.black),
                              controller: passwordController,
                              inputType: TextInputType.text,
                              isPassword:
                                  BlocProvider.of<RegisterCubit>(context)
                                      .isPassword,
                              suffix: BlocProvider.of<RegisterCubit>(context)
                                  .suffix,
                              suffixFun: () {
                                BlocProvider.of<RegisterCubit>(context)
                                    .changePasswordVisibility();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabeledTextField(text: "Verify Password"),
                            SizedBox(height: 5.h),
                            CustomTextFormField(
                              icon: const Icon(Icons.lock, color: Colors.black),
                              labelText: "Verify Password",
                              controller: confirmPasswordController,
                              inputType: TextInputType.text,
                              isPassword:
                                  BlocProvider.of<RegisterCubit>(context)
                                      .isVerifyPassword,
                              suffix: BlocProvider.of<RegisterCubit>(context)
                                  .suffixVerify,
                              suffixFun: () {
                                BlocProvider.of<RegisterCubit>(context)
                                    .changeVerifyPasswordVisibility();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        CustomButton(
                            onPressed: () {
                              context.push('/otp');
                            },
                            text: "Register",
                            color: darkColor),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF1E232C)),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor: WidgetStateProperty.all(
                                      Colors.transparent)),
                              onPressed: () {
                                context.push('/login');
                              },
                              child: Text(
                                "Login Now",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: mainColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
