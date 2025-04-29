import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/shared/widgets/CustomSnackbar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileCubit.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileState.dart';
import 'package:dielegende_store/features/profile/presentation/ui/widgets/ProfileImage.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterCubit.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/LabeledTextField.dart';
import 'package:dielegende_store/features/register/presentation/ui/widgets/PhoneNumberFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: Colors.white,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showCustomSnackBar(
                  context,
                  state.message,
                  backgroundColor: errorColor,
                );
              });
            } else if (state is ProfileSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showCustomSnackBar(context, state.response.message,
                    backgroundColor: Colors.green,
                    icon: Icons.check_circle_outline);
                // context.go('/home');
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ProfileImage(),
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
                          const LabeledTextField(text: "Current Password"),
                          SizedBox(height: 5.h),
                          CustomTextFormField(
                            controller: currentPasswordController,
                            inputType: TextInputType.text,
                            validation: (value) => value == null ||
                                    value.length < 8
                                ? 'Password must be at least 8 characters long'
                                : null,
                            isPassword:
                                context.watch<ProfileCubit>().isCurrentPassword,
                            suffix: context
                                .watch<ProfileCubit>()
                                .suffixCurrentPassword,
                            suffixFun: () {
                              context
                                  .read<ProfileCubit>()
                                  .changeCurrentPasswordVisibility();
                              print("state change");
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
                            controller: passwordController,
                            inputType: TextInputType.text,
                            validation: (value) => value == null ||
                                    value.length < 8
                                ? 'Password must be at least 8 characters long'
                                : null,
                            isPassword:
                                context.watch<ProfileCubit>().isPassword,
                            suffix: context.watch<ProfileCubit>().suffix,
                            suffixFun: () {
                              context
                                  .read<ProfileCubit>()
                                  .changePasswordVisibility();
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
                                context.watch<ProfileCubit>().isVerifyPassword,
                            suffix: context.watch<ProfileCubit>().suffixVerify,
                            suffixFun: () {
                              context
                                  .read<ProfileCubit>()
                                  .changeVerifyPasswordVisibility();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      state is ProfileLoading
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
                                  BlocProvider.of<ProfileCubit>(context)
                                      .updateProfile(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    currentPassword:
                                        currentPasswordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                  );
                                }
                              },
                              text: "Update Profile",
                              color: darkColor),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
