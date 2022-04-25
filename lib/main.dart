import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/ortalama_hesapla_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ColorConstatnt.anaRenk,
          // Diğer platformlarda da o platforma uygun davranmasını sağlar.
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesaplaPage(),
    );
  }
}
