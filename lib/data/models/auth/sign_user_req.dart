/// Kelas yang digunakan untuk mengirimkan data ketika user ingin melakukan
/// proses signin.
///
/// [email] adalah alamat email yang akan di simpan di database, digunakan
/// untuk verifikasi identitas user.
///
/// [password] adalah password yang akan di simpan di database, digunakan
/// untuk verifikasi identitas user.
class SigninUserReq {
  /// Alamat email yang akan di simpan di database.
  final String email;

  /// Password yang akan di simpan di database.
  final String password;

  /// Konstruktor yang digunakan untuk membuat objek [SigninUserReq] dengan
  /// memasukkan [email] dan [password] sebagai parameter.
  SigninUserReq({required this.email, required this.password});
}
