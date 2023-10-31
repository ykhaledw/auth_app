import 'package:auth_mobile_app/cubits/user_login_cubits/user_login_cubit.dart';
import 'package:auth_mobile_app/cubits/user_login_cubits/user_login_state.dart';
import 'package:auth_mobile_app/views/profile_view.dart';
import 'package:auth_mobile_app/widgets/login_body.dart';
import 'package:auth_mobile_app/widgets/profile_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginFailure) {
            print('Failed to Log in');
          }
          if (state is UserLoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const ProfileView(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is UserLoginLoading ? true : false,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  ProfilePhotos(
                    userImage: AssetImage('assets/images/intern2grow.png'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Log in to your account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LoginBody(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/*ModalProgressHUD(
          inAsyncCall: state is UserLoginLoading ? true : false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePhotos(
                  userImage: AssetImage('assets/images/intern2grow.png'),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                LoginBody(),
              ],
            ),
          ),
        )*/