abstract class UserRegistrationState {}

class UserRegistrationInitial extends UserRegistrationState {}

class UserRegistrationLoading extends UserRegistrationState {}

class UserRegistrationSuccess extends UserRegistrationState {}

class UserRegistrationFailure extends UserRegistrationState {
  final String errorMessage;

  UserRegistrationFailure(this.errorMessage);
}
