import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  // Constructor yang menginisialisasi ThemeCubit dengan mode tema default yaitu `ThemeMode.system`.
  ThemeCubit() : super(ThemeMode.system);

  // Fungsi ini digunakan untuk memperbarui tema aplikasi dengan mode tema baru.
  void updateTheme(ThemeMode thememode) => emit(thememode);

  // Fungsi ini digunakan untuk mengubah data dari JSON yang disimpan ke dalam bentuk `ThemeMode`.
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Mengambil string dari JSON yang disimpan dengan kunci 'theme'.
    final themeString = json['theme'] as String?;

    // Mengubah string yang disimpan menjadi `ThemeMode` yang sesuai.
    switch (themeString) {
      case 'light': // Jika nilai 'theme' adalah 'light', kembalikan `ThemeMode.light`.
        return ThemeMode.light;
      case 'dark': // Jika nilai 'theme' adalah 'dark', kembalikan `ThemeMode.dark`.
        return ThemeMode.dark;
      case 'system':
      default: // Jika nilai 'theme' tidak dikenal atau 'system', kembalikan `ThemeMode.system`.
        return ThemeMode.system;
    }
  }

  // Fungsi ini digunakan untuk mengubah `ThemeMode` yang sedang digunakan menjadi format JSON untuk disimpan.
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Inisialisasi variabel `themeString` untuk menyimpan mode tema dalam bentuk string.
    late final String themeString;

    // Mengubah `ThemeMode` yang sedang digunakan menjadi string untuk disimpan dalam JSON.
    switch (state) {
      case ThemeMode
            .light: // Jika `ThemeMode` adalah `light`, setel string ke 'light'.
        themeString = 'light';
        break;
      case ThemeMode
            .dark: // Jika `ThemeMode` adalah `dark`, setel string ke 'dark'.
        themeString = 'dark';
        break;
      case ThemeMode.system:
      default: // Jika `ThemeMode` adalah `system` atau lainnya, setel string ke 'system'.
        themeString = 'system';
        break;
    }

    // Mengembalikan map yang berisi string mode tema yang akan disimpan ke JSON.
    return {'theme': themeString};
  }
}
