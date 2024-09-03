// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/core/configs/assets/app_vectors.dart';

import 'package:myapp/presentation/onboarding/pages/onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9C3FE4), // Warna ungu
              Color(0xFFC65647), // Warna merah
            ],
            begin: Alignment.topLeft, // Awal gradasi dari kiri atas
            end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
          ),
        ),
        child: Center(
          child: SvgPicture.asset(AppVectors.welcomeScreen),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => OnboardingPage()));
  }
}
