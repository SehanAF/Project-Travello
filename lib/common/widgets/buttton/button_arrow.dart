// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/presentation/auth/signin.dart';

/// Kustom komponen untuk membuat tombol navigasi panah.
///
/// Menerima parameter [isBack] yang jika true maka panah akan berada di sebelah kiri,
/// dan jika false maka panah akan berada di sebelah kanan.
class ButtonArrow extends StatelessWidget {
  final bool isBack;
  const ButtonArrow({
    Key? key,
    this.isBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Membuat IconButton yang akan di render sebagai Container dengan
    /// background hitam dan bentuk lingkaran.
    return IconButton(
      onPressed: () {
        /// Saat tombol ditekan maka akan menavigasi ke halaman [SigninPage].
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SigninPage(),
          ),
        );
      },

      /// Membuat child dari IconButton, yaitu Container dengan background hitam
      /// dan bentuk lingkaran. Di dalamnya akan di render Icon panah.
      icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(
          /// Jika [isBack] true maka Icon panah akan berada di sebelah kiri,
          /// dan jika false maka Icon panah akan berada di sebelah kanan.
          isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
