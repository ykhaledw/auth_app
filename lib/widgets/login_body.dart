import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/views/profile_view.dart';
import 'package:auth_mobile_app/views/register_view.dart';
import 'package:auth_mobile_app/widgets/custom_button.dart';
import 'package:auth_mobile_app/widgets/custom_text_field.dart';
import 'package:auth_mobile_app/widgets/underline_text.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            CustomTextfField(
              textController: textController,
              icon: Icons.clear,
              onPressed: () {
                setState(() {
                  textController.clear();
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            CustomTextfField(
              textController: passwordController,
              icon: Icons.visibility_off,
              hiddenText: isVisible,
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      'Remember me',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                UnderlinedText(
                  text: 'Forgot password?',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              buttonColor: kButtonColor,
              title: 'Log in',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const ProfileView();
                      },
                    ), (route) => false);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Don\'t have a account? ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                UnderlinedText(
                  text: 'Register',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const RegisterView();
                      },
                    ), (route) => false);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
