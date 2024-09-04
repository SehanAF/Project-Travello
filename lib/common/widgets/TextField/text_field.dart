// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

/// Widget untuk membuat text field yang dapat digunakan ulang
///
/// [controller]       : controller yang digunakan untuk mengatur text field
/// [customHint]       : teks yang akan ditampilkan sebagai hint di text field
/// [prefixIcon]       : ikon yang akan ditampilkan sebelum text field
/// [obscureText=false] : apakah text field akan menampilkan teks yang diinput
///                       atau tidak (default: false)

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String customHint;
  final IconData prefixIcon;
  final bool obscureText;

  /// Konstruktor untuk membuat [CustomTextFormField]
  ///
  /// Khusus untuk [controller], jika tidak diisi maka akan dibuatkan
  /// [TextEditingController] yang baru
  CustomTextFormField({
    this.controller,
    required this.customHint,
    required this.prefixIcon,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  /// Variabel yang digunakan untuk mengatur apakah text field akan menampilkan
  /// teks yang diinput atau tidak. Defaultnya adalah true, yang berarti text field
  /// akan menampilkan teks yang diinput. Jika diatur menjadi false, maka teks yang
  /// diinput tidak akan ditampilkan.
  bool _obscureText = true;

  /// Fungsi ini digunakan untuk mengatur initial state dari [_obscureText]
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  /// Fungsi ini digunakan untuk mengatur apakah text field akan menampilkan teks
  /// yang diinput atau tidak. Jika [_obscureText] diatur menjadi true, maka teks
  /// yang diinput akan ditampilkan. Jika [_obscureText] diatur menjadi false, maka
  /// teks yang diinput tidak akan ditampilkan.
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Fungsi ini digunakan untuk membuat widget yang akan ditampilkan
  @override
  Widget build(BuildContext context) {
    /// Membuat controller yang akan digunakan untuk mengatur text field. Jika
    /// [widget.controller] tidak diisi, maka akan dibuatkan controller yang
    /// baru.
    final TextEditingController _effectiveController =
        widget.controller ?? TextEditingController();

    /// Membuat widget yang akan ditampilkan
    return Container(
      /// Membuat efek bayangan di bawah widget
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],

        /// Membuat bentuk widget menjadi bulat
        borderRadius: BorderRadius.circular(30),
      ),

      /// Membuat widget yang akan ditampilkan
      child: TextFormField(
        /// Membuat controller yang akan digunakan untuk mengatur text field
        controller: _effectiveController,

        /// Mengatur apakah teks yang diinput akan ditampilkan atau tidak
        obscureText: _obscureText,

        /// Membuat dekorasi untuk text field
        decoration: InputDecoration(
          /// Membuat hint yang akan ditampilkan di text field
          hintText: widget.customHint,

          /// Membuat background color untuk text field
          filled: true,
          fillColor: Colors.white,

          /// Membuat border untuk text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),

          /// Membuat prefix icon untuk text field
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.grey,
          ),

          /// Membuat padding untuk text field
          contentPadding: EdgeInsets.symmetric(vertical: 15),

          /// Membuat suffix icon untuk text field jika [widget.obscureText]
          /// diatur menjadi true
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _toggleObscureText,
                )
              : null,
        ),
      ),
    );
  }
}
