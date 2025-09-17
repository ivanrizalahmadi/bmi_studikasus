import 'dart:io';

void main() {
  List<String> history = [];

  while (true) {
    print("\n==============================");
    print("     APLIKASI KALKULATOR BMI  ");
    print("==============================");
    print("1. Hitung BMI");
    print("2. Lihat Riwayat Perhitungan");
    print("3. Keluar");
    stdout.write("Pilih menu (1/2/3): ");
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      // --- Input Tinggi ---
      double tinggi;
      while (true) {
        stdout.write("Masukkan tinggi badan (cm): ");
        String? inputTinggi = stdin.readLineSync();
        if (inputTinggi == null || inputTinggi.isEmpty) {
          print("⚠️  Input tidak boleh kosong!");
          continue;
        }
        try {
          tinggi = double.parse(inputTinggi);
          if (tinggi <= 0) {
            print("⚠️  Tinggi harus lebih besar dari 0!");
            continue;
          }
          break;
        } catch (e) {
          print("⚠️  Masukkan angka yang valid!");
        }
      }

      // --- Input Berat ---
      double berat;
      while (true) {
        stdout.write("Masukkan berat badan (kg): ");
        String? inputBerat = stdin.readLineSync();
        if (inputBerat == null || inputBerat.isEmpty) {
          print("⚠️  Input tidak boleh kosong!");
          continue;
        }
        try {
          berat = double.parse(inputBerat);
          if (berat <= 0) {
            print("⚠️  Berat harus lebih besar dari 0!");
            continue;
          }
          break;
        } catch (e) {
          print("⚠️  Masukkan angka yang valid!");
        }
      }

      // --- Hitung BMI ---
      double tinggiMeter = tinggi / 100;
      double bmi = berat / (tinggiMeter * tinggiMeter);

      // --- Kategorisasi lebih detail ---
      String kategori;
      if (bmi < 16) {
        kategori = "Sangat Kurus (Underweight Parah)";
      } else if (bmi >= 16 && bmi < 18.5) {
        kategori = "Kurus (Underweight)";
      } else if (bmi >= 18.5 && bmi < 23) {
        kategori = "Normal (Ideal)";
      } else if (bmi >= 23 && bmi < 27.5) {
        kategori = "Overweight (Gemuk)";
      } else {
        kategori = "Obesitas";
      }

      // --- Simpan ke riwayat dengan timestamp ---
      String hasil =
          "[${DateTime.now()}] Tinggi: ${tinggi.toStringAsFixed(1)} cm, Berat: ${berat.toStringAsFixed(1)} kg, BMI: ${bmi.toStringAsFixed(2)} → $kategori";
      history.add(hasil);

      // --- Tampilkan hasil ---
      print("\n🎯 Hasil Perhitungan BMI:");
      print("Tinggi : ${tinggi.toStringAsFixed(1)} cm");
      print("Berat  : ${berat.toStringAsFixed(1)} kg");
      print("BMI    : ${bmi.toStringAsFixed(2)}");
      print("Kategori: $kategori");

    } else if (pilihan == '2') {
      // --- Lihat Riwayat ---
      if (history.isEmpty) {
        print("\n📂 Belum ada riwayat perhitungan.");
      } else {
        print("\n📖 Riwayat Perhitungan BMI:");
        for (int i = 0; i < history.length; i++) {
          print("${i + 1}. ${history[i]}");
        }
      }

    } else if (pilihan == '3') {
      print("\nTerima kasih telah menggunakan aplikasi BMI! 🙌");
      break;

    } else {
      print("⚠️  Pilihan tidak valid, coba lagi.");
    }
  }
}
