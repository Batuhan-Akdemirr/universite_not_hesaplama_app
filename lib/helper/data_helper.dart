import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/model/ders.dart';

class DataHelper {
  // Tüm derslerin ekleneceği liste boş olarak oluşturuldu
  static List<Ders> tumEklenenDersler = [];

  // Dersleri listeye ekleyecek metod
  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  // Ortalama değerini bulan metod
  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot += element.krediDegeri * element.harfDegeri;
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  //Tüm derslerin harflerinin olduğu bir liste oluşturuldu.
  static List<String> _tumDersHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  // Harflerin sayısal karşılığı
  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

// Harfleri bir liste içinde DropdownMenuItem'a dönüştürüyoruz
  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDersHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

// Tüm kredi değerlerinin bulunduğu liste
  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1);
  }

// Kredileri bir liste içinde DropdownMenuItem'a dönüştürüyoruz
  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
