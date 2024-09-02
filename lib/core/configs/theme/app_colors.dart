import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xffFF3951);
  static const lightBackground = Color(0xffF2F2F2);
  static const darkBackground = Color(0xff0D0C0C);
  static const grey = Color(0xffBEBEBE);
  static const darkGrey = Color(0xff343434);

  static const gradientPrimary = LinearGradient(
    colors: [
      Color(0xFF9C3FE4), // Warna ungu
      Color(0xFFC65647), // Warna merah
    ],
    begin: Alignment.topLeft, // Awal gradasi dari kiri atas
    end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
  );
}
