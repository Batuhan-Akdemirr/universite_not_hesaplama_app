import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/border_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/padding_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropdownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: PaddingConstant.dropDownPadding,
        decoration: BoxDecoration(
            color: ColorConstatnt.anaRenk.shade100.withOpacity(0.3),
            borderRadius: BorderConstant.borderRadiusConstant),
        child: DropdownButton<double>(
          value: secilenHarfDegeri,
          elevation: 16,
          // Dropdown'daki icon'un rengini değiştiridk.
          iconEnabledColor: ColorConstatnt.anaRenk.shade200,
          items: DataHelper.tumDerslerinHarfleri(),
          onChanged: (deger) {
            setState(() {
              secilenHarfDegeri = deger!;
              // Buralar çokomelli
              widget.onHarfSecildi(secilenHarfDegeri);
            });
          },
          underline: Container(),
        ));
  }
}
