import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/border_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Function onSecilenDersGirildi;
  var formKey = GlobalKey<FormState>();
  TextFormFieldWidget(
      {Key? key, required this.onSecilenDersGirildi, required this.formKey}) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() {
    return _TextFormFieldWidgetState();
  }
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
          widget.onSecilenDersGirildi(deger);
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'Ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Ders Gieiniz',
        border: OutlineInputBorder(
          borderRadius: BorderConstant.borderRadiusConstant,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstatnt.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
}
