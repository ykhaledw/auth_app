import 'package:auth_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileCustomTextField extends StatelessWidget {
  const ProfileCustomTextField({super.key, this.textController, required this.readOnly});

  final TextEditingController? textController;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
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
      ),
    );
  }
}
