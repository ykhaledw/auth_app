import 'package:auth_mobile_app/widgets/cover_photo.dart';
import 'package:auth_mobile_app/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class ProfilePhotos extends StatelessWidget {
  const ProfilePhotos({
    super.key, required this.userImage,
  });

  final ImageProvider userImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        children: [
          const CoverPhoto(),
          ProfilePicture(userImage: userImage),
        ],
      ),
    );
  }
}
