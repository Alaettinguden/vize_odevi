import 'package:flutter/material.dart';

import 'package:Alaettin/sifremiUnuttum.dart';
import 'package:Alaettin/kayit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/kayit": (context) => kayit(),
        "/sifremiUnuttum": (context) => sifremiUnuttum(),
      },
      home: new loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  loginPage1 createState() => loginPage1();
}

class loginPage1 extends State<loginPage> {
  String kadi;
  String sifre;
  final _degeranahtar = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _degeranahtar,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı:",
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
                    labelText: "Şifre:",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifre = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text("Şifremi Unuttum"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/sifremiUnuttum");
                      },
                    ),
                    MaterialButton(
                      child: Text("Kayıt Ol"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/kayit");
                      },
                    ),
                     
                  ],
                ),
                RaisedButton(
                      child: Text("Giriş"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (kadi == "demo" && sifre == "demo"){
                          debugPrint("Giriş Başarılı");                        
                        } else {
                          debugPrint("Kullanıcı Adı VEYA Şifre Hatalı");
                        }
                      },
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
