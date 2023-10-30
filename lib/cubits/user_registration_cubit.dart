import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/cubits/user_registration_states.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  UserRegistrationCubit() : super(UserRegistrationInitial());

  addUser(UserModel user) async {
    emit(UserRegistrationLoading());

    try {
      var usersBox = Hive.box(kUserBox);

      await usersBox.add(user);
      emit(UserRegistrationSuccess());
    } catch (e) {
      emit(UserRegistrationFailure(e.toString()));
    }
  }
}
