// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/presentation/auth/signin.dart';

class ButtonArrow extends StatelessWidget {
  final bool isBack;
  const ButtonArrow({Key? key, this.isBack = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SigninPage()));
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            size: 20,
            color: Colors.white,
          ),
        ));
  }
}
