// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/TextField/text_field.dart';
import 'package:myapp/common/widgets/buttton/button_login.dart';
import 'package:myapp/core/configs/assets/app_images.dart';
import 'package:myapp/core/configs/theme/app_colors.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/domain/repository/usecases/auth/signup.dart';

import 'package:myapp/presentation/home/pages/main_screen.dart';
import 'package:myapp/service_locator.dart';

class SingnupPage extends StatelessWidget {
  SingnupPage({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

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
                  _buildUsernameField(context),
                  SizedBox(
                    height: 40,
                  ),
                  _buildPasswordField(context),
                  SizedBox(
                    height: 30,
                  ),
                  _buildEmailField(context),
                  SizedBox(
                    height: 30,
                  ),
                  _buildMobileField(context),
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

  Widget _buildUsernameField(BuildContext context) {
    return CustomTextFormField(
        controller: _name,
        customHint: "Username",
        prefixIcon: Icons.person_4_outlined,
        obscureText: false);
  }

  Widget _buildPasswordField(BuildContext context_) {
    return CustomTextFormField(
        controller: _password,
        customHint: "Password",
        prefixIcon: Icons.lock,
        obscureText: true);
  }

  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      controller: _email,
      customHint: "Email",
      prefixIcon: Icons.email,
      obscureText: false,
    );
  }

  Widget _buildMobileField(BuildContext context) {
    return CustomTextFormField(
        controller: _mobile,
        customHint: "Number Handphone",
        prefixIcon: Icons.mobile_friendly,
        obscureText: false);
  }

  Widget _buildSigninButton(BuildContext context) {
    return CustomButtonLogin(
      customText: "Create",
      onPressed: () async {
        var result = await s1<SignupUseCase>().call(
            params: CreateUserReq(
          name: _name.text.toString(),
          email: _email.text.toString(),
          password: _password.text.toString(),
          numberPhone: _mobile.text.toString(),
        ));

        result.fold(
          (l) {
            var snackbar = SnackBar(content: Text(l));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          (r) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
          },
        );
      },
    );
  }
}
