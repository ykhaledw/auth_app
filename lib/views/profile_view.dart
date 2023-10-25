import 'package:auth_mobile_app/widgets/profile_body.dart';
import 'package:auth_mobile_app/widgets/profile_photos.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePhotos(
              userImage: NetworkImage('https://i.pinimg.com/564x/d5/cb/77/d5cb77ff9a3deea8995dc20d3a3d6d31.jpg'),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Youssef Khaled',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
