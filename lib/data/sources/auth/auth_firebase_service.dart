// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';

abstract class AuthFireBaseService {
  Future<Either> signin(SigninUserReq signUserReq);
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFireBaseService {
  @override
  Future<Either<String, String>> signin(SigninUserReq signUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signUserReq.email,
        password: signUserReq.password,
      );
      return const Right("Sigin was Successful");
    } on FirebaseAuthException catch (e) {
      bool isValidEmail(String email) {
        // Regex untuk memvalidasi format email
        final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
        return emailRegex.hasMatch(email);
      }

      String message = "";

      if (signUserReq.email.isEmpty) {
        message = 'Email cannot be empty';
      } else if (!isValidEmail(signUserReq.email)) {
        message = 'Invalid email format. Please use a @gmail.com address';
      } else if (signUserReq.password.isEmpty) {
        message = 'Password cannot be empty';
      } else if (e.code == 'invalid-username') {
        message = 'Not user found for that username/email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provider for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      if (createUserReq.name.isEmpty) {
        return Left('Your name cannot be empty');
      } else if (createUserReq.email.isEmpty) {
        return Left('Email cannot be empty');
      } else if (createUserReq.password.isEmpty) {
        return Left('Password cannot be empty');
      } else if (createUserReq.numberPhone.isEmpty) {
        return Left('Username cannot be empty');
      }
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.name, 'email': data.user?.email});

      return const Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = 'The password you entered is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account with that email already exists';
      } else if (e.code == 'invalid-email') {
        message = 'The email format you entered is invalid';
      } else if (e.code == 'operation-not-allowed') {
        message = 'Registration with email and password is not permitted';
      }
      return Left(message);
    } catch (e) {
      return Left('Terjadi kesalahan. Silakan coba lagi.');
    }
  }
}
