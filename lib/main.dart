import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/cubits/user_registration_cubit.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kUserBox);
  Hive.registerAdapter(UserModelAdapter());
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> UserRegistrationCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
