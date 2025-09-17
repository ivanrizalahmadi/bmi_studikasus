import 'package:dart_application_2/dart_application_2.dart' as dart_application_2;

import 'dart:io';

void main() {
  List<String> history = [];

  while (true) {
    print("=== Kalkulator BMI ===");

    // Input
    stdout.write("Masukkan tinggi badan (cm): ");
    double tinggi = double.parse(stdin.readLineSync()!);

    stdout.write("Masukkan berat badan (kg): ");
    double berat = double.parse(stdin.readLineSync()!);

    // Hitung BMI
    double tinggiMeter = tinggi / 100;
    double bmi = berat / (tinggiMeter * tinggiMeter);

    // Kategorisasi
    String kategori;
    if (bmi < 18.5) {
      kategori = "Kurus";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      kategori = "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      kategori = "Gemuk";
    } else {
      kategori = "Obesitas";
    }

    // Simpan ke riwayat
    String hasil = "Tinggi: $tinggi cm, Berat: $berat kg, BMI: ${bmi.toStringAsFixed(2)}, Kategori: $kategori";
    history.add(hasil);

    print("Hasil: $hasil");

    // Tampilkan riwayat
    print("\n--- Riwayat Perhitungan ---");
    for (var h in history) {
      print(h);
    }

    // Tanya lanjut?
    stdout.write("\nHitung lagi? (ya/tidak): ");
    String? ulang = stdin.readLineSync();
    if (ulang?.toLowerCase() != 'y') {
      print("Terima kasih telah menggunakan kalkulator BMI!");
      break;
    }
  }
}

