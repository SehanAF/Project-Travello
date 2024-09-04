import 'package:dartz/dartz.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';
import 'package:myapp/data/sources/auth/auth_firebase_service.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  /// Method ini digunakan untuk melakukan signin dengan menggunakan akun yang
  /// telah terdaftar di Firebase Authentication.
  ///
  /// Method ini akan mengembalikan nilai berupa [Either] yang berisi status
  /// berhasil atau gagalnya proses signin. Jika berhasil maka akan
  /// mengembalikan nilai [Right] yang berisi token Firebase Authentication.
  /// Jika gagal maka akan mengembalikan nilai [Left] yang berisi pesan kesalahan.
  ///
  /// [SigninUserReq] adalah parameter yang dibutuhkan untuk melakukan signin.
  /// Parameter ini berisi email dan password yang akan digunakan untuk signin.
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    /// Panggilan method [signin] dari [AuthFireBaseService] yang akan
    /// melakukan proses signin dengan menggunakan parameter [signinUserReq].
    return await s1<AuthFireBaseService>().signin(signinUserReq);
  }

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
  Future<Either> signup(CreateUserReq createUserReq) async {
    /// Panggilan method [signup] dari [AuthFireBaseService] yang akan
    /// melakukan proses signup dengan menggunakan parameter [createUserReq].
    return await s1<AuthFireBaseService>().signup(createUserReq);
  }
}
