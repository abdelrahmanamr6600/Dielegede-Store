import 'package:dielegende_store/features/profile/data/repo/ProfileRepo.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profilerepo) : super(ProfileInitial());
  final Profilerepo _profilerepo;

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(ProfileLoading());
    final result = await _profilerepo.updateProfile(
      name: name,
      email: email,
      phone: phone,
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (failure) => emit(ProfileFailure(failure.errorMessage)),
      (model) => emit(ProfileSuccess(model)),
    );
  }

  IconData? suffixCurrentPassword = Icons.visibility_outlined;
  bool isCurrentPassword = true;

  IconData? suffix = Icons.visibility_outlined;
  bool isPassword = true;

  IconData? suffixVerify = Icons.visibility_outlined;
  bool isVerifyPassword = true;

  void changeCurrentPasswordVisibility() {
    isCurrentPassword = !isCurrentPassword;
    suffixCurrentPassword = isCurrentPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangeCurrentPasswordVisibilityState());
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
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
