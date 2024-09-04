import 'package:get_it/get_it.dart';
import 'package:myapp/data/repository/auth/auth_repository_impl.dart';
import 'package:myapp/data/sources/auth/auth_firebase_service.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/domain/repository/usecases/auth/signin.dart';
import 'package:myapp/domain/repository/usecases/auth/signup.dart';

final s1 = GetIt.instance;

/// Inisialisasi dependency injection untuk semua class yang
/// digunakan di aplikasi. Metode ini akan mendaftarkan
/// instance dari setiap class yang digunakan ke dalam
/// service locator.
///
/// [AuthFireBaseService] adalah abstrak class yang digunakan
/// sebagai interface untuk mengatur authentikasi dengan
/// menggunakan Firebase Authentication.
///
/// [AuthRepository] adalah abstrak class yang digunakan sebagai
/// interface untuk mengatur authentikasi dalam aplikasi.
/// Kelas ini memiliki dua metode yaitu [signup] dan [signin].
///
/// [SignupUseCase] adalah class yang digunakan sebagai interface
/// untuk melakukan proses signup dengan menggunakan akun yang
/// belum terdaftar di Firebase.
///
/// [SigninUseCase] adalah class yang digunakan sebagai interface
/// untuk melakukan proses signin dengan menggunakan akun yang
/// telah terdaftar di Firebase.
Future<void> initializeDependencies() async {
  /// Daftarkan instance dari [AuthFireBaseService] ke dalam
  /// service locator.
  s1.registerSingleton<AuthFireBaseService>(AuthFirebaseServiceImpl());

  /// Daftarkan instance dari [AuthRepository] ke dalam
  /// service locator.
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  /// Daftarkan instance dari [SignupUseCase] ke dalam
  /// service locator.
  s1.registerSingleton<SignupUseCase>(SignupUseCase());

  /// Daftarkan instance dari [SigninUseCase] ke dalam
  /// service locator.
  s1.registerSingleton<SigninUseCase>(SigninUseCase());
}
