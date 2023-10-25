import 'package:auth_mobile_app/constants.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/widgets/custom_button.dart';
import 'package:auth_mobile_app/widgets/profile_custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectedOption;
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
            ProfileCustomTextField(
              readOnly: false,
              textController: textController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ProfileCustomTextField(
              readOnly: false,
              textController: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kFormColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kFormColor),
                ),
                hintText: selectedOption,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kFormColor,
                  ),
                  onPressed: showOptions,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonColor: const Color(0xffDC3545),
              title: 'Log out',
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginView();
                      },
                    ), (route) => false);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void showOptions() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: const Text(
                'Male',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(
                  () {
                    selectedOption = 'Male';
                  },
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Female',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  selectedOption = 'Female';
                });
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
