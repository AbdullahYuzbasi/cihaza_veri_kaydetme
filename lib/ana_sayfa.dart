import 'package:cihaza_veri_kaydetme/karsilama_sayfasi.dart';
import 'package:cihaza_veri_kaydetme/giris_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String _kullaniciAdi = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){   //bunu built icinde degil burada tanimliyoruz.
      _kullaniciAdiniKontrolEt(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // build fonk birden fazla kez calisabilir. bir kez calismasini istedigimiz bir durumu
    //iniState kullarak yapmak daha sagliklidir ama bunun icin ise stateful olmasi gerekir.

    //_kullaniciAdiniKontrolEt(context); // su an boyle hata verir ekran cizilmeden cagrildigi icin
    return Scaffold(                     // yukardaki ozel fonk "(WidgetsBinding.instance.addPostFrameCallback((_){}); " ile cozulur.
      appBar: AppBar(                    //ekran ilk cizilmesini saglar sonra calisir.
        backgroundColor: Colors.purple,
      ),
    );
  }

  void _kullaniciAdiniKontrolEt(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //veriyi okumak icin ilk nesneyi olusturduk
    _kullaniciAdi = prefs.getString("kullaniciAdi") ?? "";  //varsa sol yoksa yani null ise sag tarafi atar

    if(_kullaniciAdi.isEmpty){
      _girisSayfasiniAc(context);
    }else{
      _karsilamaSayfasiniAc(context);
    }
  }

  void _sayfaAc(BuildContext context, Widget sayfa){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context){
        return sayfa;
      },
    );
    Navigator.push(context, sayfaYolu);
  }

  void _girisSayfasiniAc(BuildContext context){
    _sayfaAc(context, GirisSayfasi());
  }

  void _karsilamaSayfasiniAc(BuildContext context) {
    _sayfaAc(context, KarsilamaSayfasi(_kullaniciAdi));
  }
}
