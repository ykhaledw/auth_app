import 'package:auth_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfField extends StatelessWidget {
  const CustomTextfField({
    super.key,
    this.onPressed,
    required this.icon,
    this.hiddenText = false,
    this.textController, this.onChanged,
  });

  final void Function()? onPressed;
  final IconData icon;
  final bool hiddenText;
  final TextEditingController? textController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Required field';
        } else {
          return null;
        }
      },
      cursorColor: kFormColor,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kFormColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kFormColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kFormColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kFormColor),
        ),
        suffixIcon: IconButton(
          color: kFormColor,
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ),
      obscureText: hiddenText,
    );
  }
}
