import 'package:flutter/material.dart';

void main() {
  runApp(sifremiUnuttum());
}

class sifremiUnuttum extends StatefulWidget {
  @override
  sifremiUnuttum1 createState() => sifremiUnuttum1();
}

class sifremiUnuttum1 extends State<sifremiUnuttum> {
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kayıtlı E-posta Adresiniz",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    eposta = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Gönder"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (eposta == "") {
                          debugPrint("Adres Alanı Boş");
                        } else {
                          debugPrint(
                              "$eposta Adresine Şifre Sıfırlama Gönderildi");
                          Navigator.pop(context, "/main");
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("Giriş Sayfası"),
                      onPressed: (){
                         Navigator.pop(context, "/main");
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