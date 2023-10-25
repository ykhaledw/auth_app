import 'package:auth_mobile_app/widgets/profile_photos.dart';
import 'package:auth_mobile_app/widgets/register_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}
