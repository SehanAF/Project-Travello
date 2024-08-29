// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/core/configs/assets/app_images.dart';

import 'package:myapp/core/configs/assets/app_vectors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppImages.imageLoginTop),
          ),
          Text("Hello"),
          Text("Sign in to your account"),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.imageLogin),
          ),
        ],
      ),
    );
  }
}
