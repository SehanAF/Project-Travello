// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';

/// Abstract class yang digunakan sebagai interface untuk
/// mengatur authentikasi menggunakan Firebase Authentication.
///
/// Kelas ini memiliki dua metode yaitu [signin] dan [signup].
/// [signin] digunakan untuk melakukan proses signin dengan
/// menggunakan akun yang telah terdaftar di Firebase.
/// Sedangkan [signup] digunakan untuk melakukan proses signup
/// dengan menggunakan akun yang belum terdaftar di Firebase.
abstract class AuthFireBaseService {
  /// Method ini digunakan untuk melakukan proses signin dengan
  /// menggunakan akun yang telah terdaftar di Firebase.
  ///
  /// Method ini akan mengembalikan nilai berupa [Either] yang
  /// berisi status berhasil atau gagalnya proses signin.
  /// Jika berhasil maka akan mengembalikan nilai [Right] yang
  /// berisi token Firebase Authentication.
  /// Jika gagal maka akan mengembalikan nilai [Left] yang berisi
  /// pesan kesalahan.
  Future<Either> signin(SigninUserReq signUserReq);

  /// Method ini digunakan untuk melakukan proses signup dengan
  /// menggunakan akun yang belum terdaftar di Firebase.
  ///
  /// Method ini akan mengembalikan nilai berupa [Either] yang
  /// berisi status berhasil atau gagalnya proses signup.
  /// Jika berhasil maka akan mengembalikan nilai [Right] yang
  /// berisi token Firebase Authentication.
  /// Jika gagal maka akan mengembalikan nilai [Left] yang berisi
  /// pesan kesalahan.
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFireBaseService {
  @override

  /// Method ini digunakan untuk melakukan proses signin dengan
  /// menggunakan akun yang telah terdaftar di Firebase.
  ///
  /// Method ini akan mengembalikan nilai berupa [Either] yang
  /// berisi status berhasil atau gagalnya proses signin.
  /// Jika berhasil maka akan mengembalikan nilai [Right] yang
  /// berisi token Firebase Authentication.
  /// Jika gagal maka akan mengembalikan nilai [Left] yang berisi
  /// pesan kesalahan.
  ///
  /// Method ini akan menangani beberapa kasus error yang mungkin
  /// terjadi, seperti email yang kosong, format email yang tidak
  /// valid, password yang kosong, akun yang tidak ditemukan,
  /// atau password yang salah.
  Future<Either<String, String>> signin(SigninUserReq signUserReq) async {
    try {
      /// Lakukan signin dengan menggunakan email dan password
      /// yang diberikan.
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signUserReq.email,
        password: signUserReq.password,
      );

      /// Jika berhasil maka kembalikan nilai [Right] yang berisi
      /// token Firebase Authentication.
      return const Right("Sigin was Successful");
    } on FirebaseAuthException catch (e) {
      /// Jika gagal maka tangani error yang terjadi dan kembalikan
      /// nilai [Left] yang berisi pesan kesalahan.
      ///
      /// Cek apakah email yang diberikan kosong atau tidak.
      bool isValidEmail(String email) {
        /// Regex untuk memvalidasi format email.
        final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
        return emailRegex.hasMatch(email);
      }

      String message = '';

      if (signUserReq.email.isEmpty) {
        /// Jika email kosong maka kembalikan pesan kesalahan.
        message = 'Email cannot be empty';
      } else if (!isValidEmail(signUserReq.email)) {
        /// Jika format email tidak valid maka kembalikan pesan
        /// kesalahan.
        message = 'Invalid email format. Please use a @gmail.com address';
      } else if (signUserReq.password.isEmpty) {
        /// Jika password kosong maka kembalikan pesan kesalahan.
        message = 'Password cannot be empty';
      } else if (e.code == 'invalid-username') {
        /// Jika akun tidak ditemukan maka kembalikan pesan kesalahan.
        message = 'Not user found for that username/email';
      } else if (e.code == 'invalid-credential') {
        /// Jika password salah maka kembalikan pesan kesalahan.
        message = 'Wrong password provider for that user';
      }

      /// Kembalikan nilai [Left] yang berisi pesan kesalahan.
      return Left(message);
    }
  }

  @override

  /// Method ini digunakan untuk melakukan signup dengan menggunakan akun yang
  /// belum terdaftar di Firebase Authentication.
  ///
  /// Method ini akan mengembalikan nilai berupa [Either] yang berisi status
  /// berhasil atau gagalnya proses signup. Jika berhasil maka akan
  /// mengembalikan nilai [Right] yang berisi token Firebase Authentication.
  /// Jika gagal maka akan mengembalikan nilai [Left] yang berisi pesan kesalahan.
  ///
  /// [CreateUserReq] adalah parameter yang dibutuhkan untuk melakukan signup.
  /// Parameter ini berisi nama, email, password, dan nomor handphone yang akan
  /// digunakan untuk signup.
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      /// Cek apakah email yang diberikan kosong atau tidak.
      if (createUserReq.name.isEmpty) {
        return Left('Your name cannot be empty');
      } else if (createUserReq.email.isEmpty) {
        return Left('Email cannot be empty');
      } else if (createUserReq.password.isEmpty) {
        return Left('Password cannot be empty');
      } else if (createUserReq.numberPhone.isEmpty) {
        return Left('Username cannot be empty');
      }

      /// Lakukan signin dengan menggunakan email dan password yang diberikan.
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      /// Simpan data user ke dalam database Firestore.
      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.name, 'email': data.user?.email});

      /// Jika berhasil maka kembalikan nilai [Right] yang berisi
      /// token Firebase Authentication.
      return const Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      /// Jika gagal maka tangani error yang terjadi dan kembalikan
      /// nilai [Left] yang berisi pesan kesalahan.
      String message = 'Terjadi kesalahan. Silakan coba lagi.';

      /// Cek apakah error yang terjadi adalah karena password yang
      /// kurang kuat.
      if (e.code == 'weak-password') {
        message = 'The password you entered is too weak';
      }

      /// Cek apakah error yang terjadi adalah karena email yang
      /// sudah digunakan.
      else if (e.code == 'email-already-in-use') {
        message = 'An account with that email already exists';
      }

      /// Cek apakah error yang terjadi adalah karena format email
      /// yang tidak valid.
      else if (e.code == 'invalid-email') {
        message = 'The email format you entered is invalid';
      }

      /// Cek apakah error yang terjadi adalah karena operasi yang
      /// tidak diizinkan.
      else if (e.code == 'operation-not-allowed') {
        message = 'Registration with email and password is not permitted';
      }
      return Left(message);
    } catch (e) {
      /// Jika error yang terjadi bukan FirebaseAuthException maka
      /// kembalikan nilai [Left] yang berisi pesan kesalahan.
      return Left('Terjadi kesalahan. Silakan coba lagi.');
    }
  }
}
