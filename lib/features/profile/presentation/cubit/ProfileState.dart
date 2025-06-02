import 'package:dielegende_store/features/profile/data/model/ProfileModel.dart';
import 'package:dielegende_store/features/profile/data/model/model.dart';

abstract class ProfileState {}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final UpdateProfileModel response;

  UpdateProfileSuccess(this.response);
}

class UpdateProfileFailure extends ProfileState {
  final String message;

  UpdateProfileFailure(this.message);
}

class ProfileInitialState extends ProfileState {}

class ChangePasswordVisibilityState extends ProfileState {}

class ChangeVerifyPasswordVisibilityState extends ProfileState {}

class ChangeCurrentPasswordVisibilityState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;
  final List<Favorite> favorites;
  final int favoritesCount;

  ProfileSuccess({
    required this.user,
    required this.favorites,
    required this.favoritesCount,
  });
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}

class ProfileLoggedLoading extends ProfileState {}
class ProfileLoggedOut extends ProfileState {}

