/// Abstract class yang digunakan sebagai template untuk membuat use case.
///
/// Use case adalah sebuah logika bisnis yang digunakan untuk mengatur alur
/// aplikasi. Logika bisnis ini dapat berupa pengolahan data, pengambilan
/// data dari API, atau melakukan operasi lainnya.
///
/// [Type] adalah tipe data yang akan dikembalikan oleh use case ini.
/// [Params] adalah parameter yang dibutuhkan oleh use case ini untuk
/// menjalankan logika bisnisnya.
///
/// Metode [call] adalah metode yang akan dijalankan oleh use case ini.
/// Metode ini akan mengembalikan nilai berupa [Type] yang telah di
/// definisikan sebelumnya.
abstract class UseCase<Type, Params> {
  /// Metode yang akan dijalankan oleh use case ini.
  ///
  /// Metode ini akan mengembalikan nilai berupa [Type] yang telah di
  /// definisikan sebelumnya.
  Future<Type> call({Params params});
}
