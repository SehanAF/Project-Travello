// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/TextField/text_field.dart';
import 'package:myapp/common/widgets/buttton/button_login.dart';
import 'package:myapp/core/configs/assets/app_images.dart';
import 'package:myapp/core/configs/theme/app_colors.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';
import 'package:myapp/domain/repository/usecases/auth/signin.dart';
import 'package:myapp/presentation/auth/singnup.dart';
import 'package:myapp/presentation/home/pages/main_screen.dart';
import 'package:myapp/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(AppImages.imageLoginTop),
            ),
            Text(
              "Hello",
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign in to your account",
              style: TextStyle(fontSize: 20, color: AppColors.darkBackground),
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
                  _buildForgotPassword(),
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
                  child: Column(
                    children: [
                      _buildSigninButton(context),
                      SizedBox(
                        height: 100,
                      ),
                      _supportText(context),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(AppImages.imageLogin),
                ),
              ],
            ),
            // Expanded(
            //   flex: 10,
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Image.asset(AppImages.imageLogin),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return CustomTextFormField(
        controller: _email,
        customHint: "Email",
        prefixIcon: Icons.person_4_outlined,
        obscureText: false);
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
      controller: _password,
      customHint: "Password",
      prefixIcon: Icons.lock,
      obscureText: true,
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          print("tombol support forgot password");
        },
        child: Text(
          "Forgot your password?",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSigninButton(BuildContext context) {
    return CustomButtonLogin(
        customText: "Sign in",
        onPressed: () async {
          var result = await s1<SigninUseCase>().call(
              params: SigninUserReq(
                  email: _email.text.toString(),
                  password: _password.text.toString()));
          result.fold(
            (l) {
              var snackbar = SnackBar(
                content: Text(l),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            (r) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (route) => false);
            },
          );
        });
  }

  Widget _supportText(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Click Here',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SingnupPage()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
