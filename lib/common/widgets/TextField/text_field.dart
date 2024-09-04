import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String customHint;
  final IconData prefixIcon;
  final bool obscureText;

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
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _effectiveController =
        widget.controller ?? TextEditingController();

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
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.customHint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
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
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
