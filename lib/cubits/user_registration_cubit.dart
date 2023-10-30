import 'package:auth_mobile_app/cubits/user_registration_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState>{
  UserRegistrationCubit() : super(UserRegistrationInitial());
}