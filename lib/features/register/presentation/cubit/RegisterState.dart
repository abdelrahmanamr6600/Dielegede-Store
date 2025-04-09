import 'package:dielegende_store/features/register/data/model/RegisterModel.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseModel response;

  RegisterSuccess(this.response);
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}

class RegisterInitialState extends RegisterState {}

class ChangePasswordVisibilityState extends RegisterState {}
class ChangeVerifyPasswordVisibilityState extends RegisterState {}

