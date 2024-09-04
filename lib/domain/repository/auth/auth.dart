import 'package:dartz/dartz.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';

/// Abstrak class yang digunakan sebagai interface untuk mengatur authentikasi
/// dalam aplikasi. Kelas ini memiliki dua metode yaitu [signup] dan [signin].
///
/// [signup] digunakan untuk melakukan proses signup dengan menggunakan akun
/// yang belum terdaftar di Firebase. Sedangkan [signin] digunakan untuk
/// melakukan proses signin dengan menggunakan akun yang telah terdaftar di
/// Firebase.
///
/// Kedua metode tersebut akan mengembalikan nilai berupa [Either] yang berisi
/// status berhasil atau gagalnya proses authentikasi. Jika berhasil maka akan
/// mengembalikan nilai [Right] yang berisi token Firebase Authentication.
/// Jika gagal maka akan mengembalikan nilai [Left] yang berisi pesan kesalahan.
abstract class AuthRepository {
  /// Method ini digunakan untuk melakukan proses signup dengan menggunakan
  /// akun yang belum terdaftar di Firebase.
  Future<Either> signup(CreateUserReq createUserReq);

  /// Method ini digunakan untuk melakukan proses signin dengan menggunakan
  /// akun yang telah terdaftar di Firebase.
  Future<Either> signin(SigninUserReq signinUserReq);
}
