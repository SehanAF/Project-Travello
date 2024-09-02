// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/TextField/text_field.dart';
import 'package:myapp/common/widgets/buttton/button_login.dart';
import 'package:myapp/core/configs/assets/app_images.dart';
import 'package:myapp/core/configs/theme/app_colors.dart';

class SingnupPage extends StatelessWidget {
  const SingnupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(AppImages.imageDaftarTop),
            ),
            Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.darkBackground,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  _buildUsernameField(context, TextEditingController()),
                  SizedBox(
                    height: 40,
                  ),
                  _buildPasswordField(context, TextEditingController()),
                  SizedBox(
                    height: 30,
                  ),
                  _buildEmailField(context, TextEditingController()),
                  SizedBox(
                    height: 30,
                  ),
                  _buildMobileField(context, TextEditingController()),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: _buildSigninButton(context),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(AppImages.imageLogin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(
      BuildContext context, TextEditingController username) {
    return CustomTextFormField(
        controller: username,
        customHint: "Username",
        customValidator: "Username cannot be empty",
        prefixIcon: Icons.person_4_outlined);
  }

  Widget _buildPasswordField(
      BuildContext context, TextEditingController password) {
    return CustomTextFormField(
        controller: password,
        customHint: "Password",
        customValidator: "Password cannot be empty",
        prefixIcon: Icons.lock);
  }

  Widget _buildEmailField(BuildContext context, TextEditingController email) {
    return CustomTextFormField(
      controller: email,
      customHint: "Email",
      customValidator: "Email cannot be empty",
      prefixIcon: Icons.email,
    );
  }

  Widget _buildMobileField(BuildContext context, TextEditingController mobile) {
    return CustomTextFormField(
        controller: mobile,
        customHint: "Number Handphone",
        customValidator: "Handphone Number cannot be empty",
        prefixIcon: Icons.mobile_friendly);
  }

  Widget _buildSigninButton(BuildContext context) {
    return CustomButtonLogin(customText: "Create");
  }
}
