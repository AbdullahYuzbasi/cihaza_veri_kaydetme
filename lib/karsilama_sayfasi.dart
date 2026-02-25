import 'package:flutter/material.dart';

class KarsilamaSayfasi extends StatelessWidget {
  String _kullaniciAdi;

  KarsilamaSayfasi(this._kullaniciAdi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
            "Karsilama Sayfasi",
        ),
      ),
      body: Center(
        child: Text(
            "Hosgeldin $_kullaniciAdi",
            style: TextStyle(
            fontSize: 32,
        ),
        ),
      ),
    );
  }
}
