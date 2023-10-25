import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  const UnderlinedText({
    super.key,
    required this.text, this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            decorationColor: Color(0xff4F90F0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}