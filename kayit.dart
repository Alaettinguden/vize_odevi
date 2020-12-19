import 'package:flutter/material.dart';

void main() {
  runApp(kayit());
}
class kayit extends StatefulWidget {
  @override
  kayitol createState() => kayitol(); 
}
class kayitol extends State<kayit> {
  String kadi;
  String sifre;
  String sifreonay;
  String eposta;
  final _degeranahtar = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _degeranahtar,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    kadi = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifre = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre Onaylayınız",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifreonay = value;
                  },
                ),
                 SizedBox(
                  height: 15.0,
                 ),
                 TextFormField(
                  decoration: InputDecoration(
                    labelText: "E-posta",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    eposta = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Giriş Sayfası"),
                      onPressed: () => Navigator.pop(context, "/main"),
                    ),
                    RaisedButton(
                      child: Text("Kaydol"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (eposta.isEmpty ||
                            kadi.isEmpty ||
                            sifre.isEmpty ||
                            sifreonay.isEmpty) {
                          debugPrint("Boş Olan Kutuları Doldurunuz");
                        } else if (sifre != sifreonay) {
                          debugPrint(
                              "Şifre ve Şifre Onayınız Birbiri İle Aynı Değil.");
                        } else {
                          debugPrint("E-posta: $eposta");
                          debugPrint("Şifre: $sifre");
                          Navigator.pop(context, "/main");
                        }
                      },
                    ),
                  ],
                ),             
              ],
            ),
          ),
        ),
      ),
    );
  }
}