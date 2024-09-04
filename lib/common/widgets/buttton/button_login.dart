import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  /// Text yang akan ditampilkan di dalam tombol login
  final String customText;

  /// Fungsi yang akan dijalankan saat tombol ditekan
  final VoidCallback onPressed;

  /// Konstruktor untuk membuat widget [CustomButtonLogin]
  CustomButtonLogin({
    Key? key,
    required this.customText,
    required this.onPressed,
  }) : super(key: key);

  /// Membuat widget yang akan di render sebagai tombol login
  @override
  Widget build(BuildContext context) {
    return Row(
      /// Membuat agar tombol berada di ujung kanan
      mainAxisAlignment: MainAxisAlignment.end,

      /// Membuat agar teks dan tombol berada di tengah
      crossAxisAlignment: CrossAxisAlignment.center,

      /// Membuat anak-anak widget
      children: <Widget>[
        /// Membuat teks yang akan ditampilkan di dalam tombol
        Center(
          child: Text(
            customText,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// Membuat jarak antar elemen
        SizedBox(width: 10),

        /// Membuat container yang akan di render sebagai tombol
        Container(
          height: 35, // Membuat tinggi container menjadi 35
          decoration: BoxDecoration(
            gradient: LinearGradient(
              /// Membuat gradasi warna
              colors: [
                Color(0xFF9C3FE4), // Warna ungu
                Color(0xFFC65647), // Warna merah
              ],
              begin: Alignment.topLeft, // Awal gradasi dari kiri atas
              end: Alignment.bottomRight, // Akhir gradasi ke kanan bawah
            ),
            borderRadius: BorderRadius.circular(
                20), // Membuat sudut container menjadi bulat
          ),
          child: ElevatedButton(
            onPressed:
                onPressed, // Membuat fungsi yang akan dijalankan saat tombol ditekan
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
