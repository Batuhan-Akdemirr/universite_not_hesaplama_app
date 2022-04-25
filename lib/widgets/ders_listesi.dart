import 'package:flutter/material.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/text_constants.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/helper/data_helper.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              //Kaydırınca silinmesi falan
              return Dismissible(
                key:
                    UniqueKey(), // Listeye eklenen her bir elemana birbirinden farklı key ler veriyor
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                direction: DismissDirection.startToEnd,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: ColorConstatnt.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}  '),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
            child: Text(
              'Lütfen Ders Ekleyin',
              style: TextConstant.baslikStyle,
            ),
          ));
  }
}
