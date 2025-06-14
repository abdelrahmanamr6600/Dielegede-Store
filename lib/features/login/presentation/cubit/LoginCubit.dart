import 'package:dielegende_store/features/login/data/repo/LoginRepo.dart';
import 'package:dielegende_store/features/login/presentation/cubit/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitialState());
  final LoginRepo _loginRepo;

  Future<void> userLogin(Map<String, dynamic> data) async {
    if (isClosed) return;

    emit(LoginLoading());

    final result = await _loginRepo.userLogin(data);
    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(LoginFailure(failure.errorMessage));
      },
      (response) {
        if (!isClosed) emit(LoginSuccess(response));
      },
    );
  }

  IconData? suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
