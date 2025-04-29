
import 'package:dielegende_store/features/profile/data/model/model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UpdateProfileModel response;

  ProfileSuccess(this.response);
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}

class ProfileInitialState extends ProfileState {}

class ChangePasswordVisibilityState extends ProfileState {}
class ChangeVerifyPasswordVisibilityState extends ProfileState {}
class ChangeCurrentPasswordVisibilityState extends ProfileState {}
