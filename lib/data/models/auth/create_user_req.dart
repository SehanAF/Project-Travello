/// Kelas yang digunakan untuk mengirimkan data ketika user ingin mendaftar
/// di aplikasi.
///
/// [name] adalah nama lengkap user yang akan di simpan di database.
/// [email] adalah alamat email user yang akan di simpan di database.
/// [password] adalah password user yang akan di simpan di database.
/// [numberPhone] adalah nomor handphone user yang akan di simpan di database.
class CreateUserReq {
  /// Nama lengkap user yang akan di simpan di database.
  final String name;

  /// Alamat email user yang akan di simpan di database.
  final String email;

  /// Password user yang akan di simpan di database.
  final String password;

  /// Nomor handphone user yang akan di simpan di database.
  final String numberPhone;

  /// Konstruktor yang digunakan untuk membuat objek [CreateUserReq].
  ///
  /// Menerima parameter [name], [email], [password], dan [numberPhone] yang
  /// akan di simpan di database.
  CreateUserReq({
    required this.name,
    required this.email,
    required this.password,
    required this.numberPhone,
  });
}
