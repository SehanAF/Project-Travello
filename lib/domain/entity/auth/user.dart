/// Kelas [UserEntitiy] digunakan untuk merepresentasikan data user yang
/// diambil dari Firebase Authentication.
///
/// [userId] adalah id unik dari user yang diambil dari Firebase
/// Authentication.
///
/// [fullName] adalah nama lengkap user yang diambil dari Firebase
/// Authentication.
///
/// [email] adalah alamat email user yang diambil dari Firebase
/// Authentication.
///
/// Konstruktor [UserEntitiy] digunakan untuk membuat objek [UserEntitiy]
/// dengan parameter [userId], [fullName], dan [email].
class UserEntitiy {
  final String? userId;
  final String? fullName;
  final String? email;

  /// Konstruktor [UserEntitiy] digunakan untuk membuat objek [UserEntitiy]
  /// dengan parameter [userId], [fullName], dan [email].
  UserEntitiy(
      {required this.userId, required this.fullName, required this.email});
}
