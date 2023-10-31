import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/cubits/user_login_cubits/user_login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

  Future<String> userLogin(
      String userNameEntered, String passwordEntered) async {
    await Hive.initFlutter();
    final box = await Hive.openBox(kUserBox);
    final userName = box.get(userNameEntered);
    final password = box.get(passwordEntered);
    emit(UserLoginLoading());

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': userNameEntered,
          'password': userNameEntered,
        },
      );
      if (userName == userNameEntered && password == passwordEntered) {
        emit(UserLoginSuccess());
        return response.data;
      }
    } catch (e) {
      emit(UserLoginFailure(e.toString()));
    }
    return '';
  }
}
