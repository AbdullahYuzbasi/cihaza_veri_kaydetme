import 'package:cihaza_veri_kaydetme/karsilama_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GirisSayfasi extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Giris Sayfasi"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                _girisYap(context);
              },
              child: Text(
                  "Giris Yap",
              style: TextStyle(
                  fontSize: 24,
              ),
              ),
          ),
        ],
      ),
    );
  }

  void _girisYap( BuildContext context) async{    //future donduruyor yani await kullancaz, awaitten dolayida async kullaniriz. HATIRLA
    SharedPreferences prefs = await SharedPreferences.getInstance(); //nesneyi olusturduk
    await prefs.setString("kullaniciAdi", _controller.text);    //string turunde kaydedecegimiz icin
    //el ile de veri girebiliriz su an
    await prefs.setInt("yas", 21);

    List<String> sehirler = ["Ankara","Istanbul","Mugla"];
    await prefs.setStringList("sehirler", sehirler);

    _karsilamaSayfasiniAc(context);
  }

  void _karsilamaSayfasiniAc(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context){
        return KarsilamaSayfasi(_controller.text);
      },
    );
    Navigator.push(context, sayfaYolu);
  }
}
