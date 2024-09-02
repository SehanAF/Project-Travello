import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String customHint;
  final String customValidator;
  final IconData prefixIcon;

  CustomTextFormField({
    this.controller,
    required this.customHint,
    required this.customValidator,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _effectiveController =
        controller ?? TextEditingController();

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: _effectiveController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return customValidator;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: customHint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
