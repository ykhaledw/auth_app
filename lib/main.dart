import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/cubits/user_login_cubits/user_login_cubit.dart';
import 'package:auth_mobile_app/cubits/user_registration_cubit.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/simple_bloc_observer.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox(kUserBox);

  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserRegistrationCubit()),
        BlocProvider(create: (context)=> UserLoginCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
