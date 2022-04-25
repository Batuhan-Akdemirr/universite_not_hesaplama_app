import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/border_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/padding_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/text_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/helper/data_helper.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/model/ders.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/ders_listesi.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/harf_drowdown.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/kredi_dropdown.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/ortalama_goster.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/widgets/text_form_field.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // Yatayda kalveyeyle çakışmayı falan önlüyor.
        appBar: AppBar(
          backgroundColor: ColorConstatnt.appBarRenk,
          elevation: 0,
          title: Center(
              child: Text(
            TextConstant.baslikText,
            style: TextConstant.baslikStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Form
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                // Ortalama Göster
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla()),
                ),
              ],
            ),
            // eXPANDED İLE SARMALAMAK LAZIM YOKSA AHAT ALIRIZ
            Expanded(child: DersListesi(
              // Aşağıdan yukarıya bilgi vermiş olduk.SeState kullanarak ortalamaGosterPage Build metodu tekrar çalıştı.
              onElemanCikarildi: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            )),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: PaddingConstant.yatay8,
              child: TextFormFieldWidget(
                formKey: formKey,
                onSecilenDersGirildi: (deger) {
                  girilenDersAdi = deger;
                },
              ) //_buildTextFormField(),
              ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: PaddingConstant.yatay8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf!;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: PaddingConstant.yatay8,
                  child: KrediDropDownWidget(onKrediSecildi: (deger) {
                    secilenKrediDegeri = deger!;
                  }),
                ),
              ),
              IconButton(
                // onPressed olduğu için metodun sonunda () kullanmadık
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: ColorConstatnt.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
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
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: BorderConstant.borderRadiusConstant,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstatnt.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!
          .save(); // bunu diyelim ki verilen kaydolsun ve değeri kullanabilelim
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(
          () {}); // set state dememiz lazım ki build metodu çalışsın ve değişiklikler görünsün
    }
  }
}
