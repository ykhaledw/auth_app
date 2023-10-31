abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginSuccess extends UserLoginState {}

class UserLoginFailure extends UserLoginState {
  final String errMessage;

  UserLoginFailure(this.errMessage);
}
