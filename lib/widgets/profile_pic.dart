import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key, required this.userImage,
  });

  final ImageProvider userImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width / 2 - 120.0,
        left: MediaQuery.of(context).size.width / 2 - 55.0,
      ),
      child: Card(
        elevation: 5,
        child: Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: userImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
