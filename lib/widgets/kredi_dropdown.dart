import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/border_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/padding_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/helper/data_helper.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropDownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: PaddingConstant.dropDownPadding,
        decoration: BoxDecoration(
            color: ColorConstatnt.anaRenk.shade100.withOpacity(0.3),
            borderRadius: BorderConstant.borderRadiusConstant),
        child: DropdownButton<double>(
          value: secilenKrediDegeri,
          elevation: 16,
          iconEnabledColor: ColorConstatnt.anaRenk.shade200,
          items: DataHelper.tumDerslerinKredileri(),
          onChanged: (deger) {
            setState(() {
              secilenKrediDegeri = deger!;
              widget.onKrediSecildi(secilenKrediDegeri);
            });
          },
          underline: Container(),
        ));
  }
}
