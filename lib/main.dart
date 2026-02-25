import 'package:cihaza_veri_kaydetme/ana_sayfa.dart';
import 'package:cihaza_veri_kaydetme/giris_sayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(
      ),
    );
  }
}