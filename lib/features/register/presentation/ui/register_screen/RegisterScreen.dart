import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/shared/widgets/CustomSnackbar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/register/data/repo/RegisterRepo.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  String selectedGender = 'male';
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
        if (state is RegisterSuccess) {
          context.go('/login');
        } else if (state is RegisterFailure) {
          showCustomSnackBar(context, state.message);
        }
      }, builder: (BuildContext context, state) {
        return Scaffold(
          appBar: const CustomAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    SizedBox(height: 20.h),
                    Text("Hello!",
                        style: AppTextStyles.largeText()
                            .copyWith(fontSize: 24.sp, color: darkColor)),
                    Text("Register to get started",
                        style: AppTextStyles.smallText().copyWith(
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
                          controller: nameController,
                          inputType: TextInputType.text,
                          validation: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Name is required'
                                  : null,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LabeledTextField(text: "Birth Of Date"),
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
                        buildPhoneNumberField(context, phoneController),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LabeledTextField(text: "Email"),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          icon: const Icon(Icons.email, color: Colors.black),
                          labelText: "Email",
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          validation: (value) =>
                              value == null || !value.contains('@')
                                  ? 'Invalid email format'
                                  : null,
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
                          controller: passwordController,
                          inputType: TextInputType.text,
                          validation: (value) => value == null ||
                                  value.length < 8
                              ? 'Password must be at least 8 characters long'
                              : null,
                          isPassword: context.watch<RegisterCubit>().isPassword,
                          suffix: context.watch<RegisterCubit>().suffix,
                          suffixFun: () {
                            context.read<RegisterCubit>().changePasswordVisibility();
                            print("state change");
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
                          validation: (value) =>
                              value != passwordController.text
                                  ? 'Password and confirmation do not match'
                                  : null,
                          isPassword:
                              context.watch<RegisterCubit>().isVerifyPassword,
                          suffix: context.watch<RegisterCubit>().suffixVerify,
                          suffixFun: () {
                            context
                                .read<RegisterCubit>()
                                .changeVerifyPasswordVisibility();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    state is RegisterLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                          )
                        : CustomButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else {
                                final data = {
                                  "name": nameController.text,
                                  "email": emailController.text,
                                  "phone": phoneController.text,
                                  "password": passwordController.text,
                                  "password_confirmation":
                                      confirmPasswordController.text,
                                  "birth_date": dateController.text,
                                  "gender": selectedGender
                                };
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(data);
                              }
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
                              fontSize: 14.sp, color: const Color(0xFF1E232C)),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  WidgetStateProperty.all(Colors.transparent)),
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
          ),
        );
      }),
    );
  }
}
