import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  final String customText;
  final VoidCallback onPressed;

  CustomButtonLogin({
    Key? key,
    required this.customText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text(customText,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))),
        SizedBox(width: 10), // Jarak antar elemen
        Container(
          height: 35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF9C3FE4), // Warna ungu
                Color(0xFFC65647), // Warna merah
              ],
              begin: Alignment.topLeft, // Awal gradasi dari kiri atas
              end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.transparent, // Menghilangkan warna latar belakang
              disabledForegroundColor: Colors.transparent.withOpacity(0.38),
              disabledBackgroundColor: Colors.transparent
                  .withOpacity(0.12), // Menghilangkan warna latar belakang
              shadowColor: Colors.transparent, // Menghilangkan bayangan
            ),
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.white,
            ),
          ),
          padding: EdgeInsets.zero, // Menghilangkan padding bawaan
          constraints: BoxConstraints(), // Menghilangkan batasan ukuran default
        ),
      ],
    );
  }
}
