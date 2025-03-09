import 'package:bloc/bloc.dart';
import 'package:dielegende_store/features/register/presentation/cubit/RegisterState.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  IconData? suffix = Icons.visibility_outlined;
  bool isPassword = true;

  IconData? suffixVerify = Icons.visibility_outlined;
  bool isVerifyPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void changeVerifyPasswordVisibility() {
    isVerifyPassword = !isVerifyPassword;
    suffixVerify = isVerifyPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangeVerifyPasswordVisibilityState());
  }
}
