import 'package:auth_mobile_app/cubits/user_registration_cubit.dart';
import 'package:auth_mobile_app/cubits/user_registration_states.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/widgets/profile_photos.dart';
import 'package:auth_mobile_app/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<UserRegistrationCubit, UserRegistrationState>(
          listener: (context, state) {
            if (state is UserRegistrationFailure) {
              print('Failed to Sign Up');
            }
            if (state is UserRegistrationSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (route) => false);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is UserRegistrationLoading ? true : false,
              child: const Column(
                children: [
                  ProfilePhotos(
                    userImage: AssetImage('assets/images/intern2grow.png'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Create new account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RegisterBody(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
