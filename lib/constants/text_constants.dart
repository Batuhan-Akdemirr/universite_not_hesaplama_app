import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universite_kredi_hesaplama_uygulamasi/constants/color_constants.dart';

class TextConstant {
  static String baslikText = 'Ortalama Hesapla';
  // const kulanmamızın sebebi derleme anında değerleri veriliyor finalde ise runtime anında bizim hangi rengi vereceğimiz belli değil.(const değerler sabit bir değerle initiliaze edilmeli. ) Google fonts IDE de mevcut olmayan bir yapı ve sabit değerli değil 
  
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: ColorConstatnt.anaRenk);

  static final TextStyle ortalamaGosterBody = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: ColorConstatnt.anaRenk);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: ColorConstatnt.anaRenk);
      
}
