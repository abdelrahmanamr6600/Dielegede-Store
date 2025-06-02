import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:dielegende_store/features/profile/data/repo/ProfileRepo.dart';
import 'package:dielegende_store/features/profile/presentation/cubit/ProfileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profilerepo) : super(ProfileInitial());
  final Profilerepo _profilerepo;

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? currentPassword,
    String? password,
    String? passwordConfirmation,
  }) async {
    emit(UpdateProfileLoading());

    final result = await _profilerepo.updateProfile(
      name: name,
      email: email,
      phone: phone,
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    result.fold(
      (failure) => emit(UpdateProfileFailure(failure.errorMessage)),
      (model) => emit(UpdateProfileSuccess(model)),
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

  Future<void> getProfile() async {
    if (isClosed) return;
    emit(ProfileLoading());

    final result = await _profilerepo.fetchProfile();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed) emit(ProfileFailure(failure.errorMessage));
      },
      (profileData) {
        if (!isClosed) {
          emit(ProfileSuccess(
            user: profileData.data.user,
            favorites: profileData.data.favorites,
            favoritesCount: profileData.data.favoritesCount,
          ));
        }
      },
    );
  }

  Future<void> logout() async {
    emit(ProfileLoading());

    final result = await _profilerepo.logout();

    result.fold(
      (failure) => emit(ProfileFailure(failure.errorMessage)),
      (message) async {
        await SecureStorageHelper.deleteToken();
        emit(ProfileLoggedOut());
      },
    );
  }
}
