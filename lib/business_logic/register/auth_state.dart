import '../../data/models/status/status.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserData userDataModel;
  RegisterSuccessState(this.userDataModel);
}

class RegisterLoadingState extends AuthState {}

class ChangePasswordVisibilityState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}
