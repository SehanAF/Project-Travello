import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/service_locator.dart';

/// SignupUseCase adalah class yang digunakan sebagai
/// interface untuk melakukan proses signup atau registrasi
/// akun pengguna. Class ini memiliki method [call] yang
/// digunakan untuk melakukan proses signup dengan menggunakan
/// parameter [CreateUserReq]. Parameter ini berisi nama,
/// email, password, dan nomor handphone yang akan
/// digunakan untuk signup.
///
/// Proses signup akan mengembalikan nilai berupa [Either]
/// yang berisi status berhasil atau gagalnya proses
/// signup. Jika berhasil maka akan mengembalikan nilai
/// [Right] yang berisi token Firebase Authentication.
/// Jika gagal maka akan mengembalikan nilai [Left] yang
/// berisi pesan kesalahan.
///
/// [AuthRepository] adalah interface yang digunakan untuk
/// melakukan proses signup. Class ini akan mengembalikan
/// nilai berupa [Either] yang berisi status berhasil atau
/// gagalnya proses signup.
///
/// [Future] adalah class yang digunakan untuk menangani
/// proses asynchronous. Class ini akan mengembalikan nilai
/// berupa [Either] yang berisi status berhasil atau gagalnya
/// proses signup.
///
/// [s1] adalah service locator yang digunakan untuk
/// menangani dependency injection. Service ini akan
/// mengembalikan instance dari [AuthRepository] yang
/// digunakan untuk melakukan proses signup.
class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    /// Panggilan method [signup] dari [AuthRepository] yang akan
    /// melakukan proses signup dengan menggunakan parameter [CreateUserReq].
    return await s1<AuthRepository>().signup(params!);
  }
}
