import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/cubits/user_registration_cubit.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/widgets/custom_button.dart';
import 'package:auth_mobile_app/widgets/custom_text_field.dart';
import 'package:auth_mobile_app/widgets/underline_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isVisible = true;
  String? image;
  late String userName;
  late String email;
  late String password;
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
              onChanged: (value) {
                userName = value;
              },
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
              'Email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            CustomTextfField(
              onChanged: (value) {
                email = value;
              },
              textController: emailController,
              icon: Icons.clear,
              onPressed: () {
                setState(() {
                  emailController.clear();
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
              onChanged: (value) {
                password = value;
              },
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
                  text: 'Have a problem?',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              buttonColor: kButtonColor,
              title: 'Register',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var userModel = UserModel(
                    imageurl: image ??
                        'https://i.pinimg.com/564x/41/c9/c9/41c9c9d27bce59854d781eeaa5698215.jpg',
                    userName: userName,
                    email: email,
                    password: password,
                  );

                  BlocProvider.of<UserRegistrationCubit>(context)
                      .addUser(userModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                UnderlinedText(
                  text: 'Log in',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginView();
                      },
                    ), (route) => false);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
