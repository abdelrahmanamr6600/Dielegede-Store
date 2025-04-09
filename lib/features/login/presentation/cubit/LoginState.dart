import 'package:dielegende_store/features/login/data/model/LoginResponse.dart';
import 'package:dielegende_store/features/register/data/model/RegisterModel.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel response;

  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

class LoginInitialState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}