import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/ff/e4/5e/ffe45e792feda086317556c96de85d68.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
