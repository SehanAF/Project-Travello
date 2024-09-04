import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/service_locator.dart';

/// Class ini digunakan sebagai interface untuk melakukan
/// proses signin dengan menggunakan akun yang telah
/// terdaftar di Firebase.
///
/// Class ini akan mengembalikan nilai berupa [Either]
/// yang berisi status berhasil atau gagalnya proses
/// signin. Jika berhasil maka akan mengembalikan nilai
/// [Right] yang berisi token Firebase Authentication.
/// Jika gagal maka akan mengembalikan nilai [Left] yang
/// berisi pesan kesalahan.
///
/// Method [call] digunakan untuk melakukan signin dengan
/// menggunakan parameter [SigninUserReq]. Parameter ini
/// berisi email dan password yang akan digunakan untuk
/// signin.
///
/// [AuthRepository] adalah interface yang digunakan untuk
/// melakukan proses signin. Class ini akan mengembalikan
/// nilai berupa [Either] yang berisi status berhasil atau
/// gagalnya proses signin.
///
/// [Future] adalah class yang digunakan untuk menangani
/// proses asynchronous. Class ini akan mengembalikan nilai
/// berupa [Either] yang berisi status berhasil atau gagalnya
/// proses signin.
///
/// [s1] adalah service locator yang digunakan untuk
/// menangani dependency injection. Service ini akan
/// mengembalikan instance dari [AuthRepository] yang
/// digunakan untuk melakukan proses signin.
class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    /// Panggilan method [signin] dari [AuthRepository] yang
    /// akan melakukan proses signin dengan menggunakan
    /// parameter [SigninUserReq].
    return await s1<AuthRepository>().signin(params!);
  }
}
