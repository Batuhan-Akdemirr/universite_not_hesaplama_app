import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/text_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {Key? key, required this.dersSayisi, required this.ortalama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
          style: TextConstant.ortalamaGosterBody,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: TextConstant.ortalamaStyle,
        ),
        Text(
          'Ortalama',
          style: TextConstant.ortalamaGosterBody,
        ),
      ],
    );
  }
}
