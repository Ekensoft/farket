import 'package:flutter/material.dart';
import 'package:farket/screens/hakkinda.dart';
import 'package:farket/screens/login.dart';
import 'package:farket/screens/kayit.dart';
import 'package:farket/screens/marketler.dart';
import 'package:farket/screens/urun_home_page.dart';
import 'package:farket/screens/urunliste.dart';

void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farket Hesaplı Alışveriş',
      theme: ThemeData(primarySwatch: Colors.blue,),
      initialRoute: '/urunler',
      routes: {
        '/': (context) => AnaSayfa(),
        '/login': (context) => Login(),
        '/kayit': (context) => Kayit(),
        '/notlar':(context) => Login(),
        '/marketler': (context) => Marketler(),
        '/urunler': (context) => UrunHomePage(),
        '/urunliste': (context) => Urunler(),
        '/hakkinda': (context) => Hakkinda(),

      },
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
  AnaSayfa();
}

class _AnaSayfaState extends State<AnaSayfa> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    if  (data != null)
    {
        email = data[0];
        password = data[1];
        Text(data[0]);
        Text(data[1]);
    };
      final marketButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Marketler()),
            );
          },
          child: Text("Marketler",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

      final urunButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UrunHomePage(),
              ),
            );
          },
          child: Text("Ürünler",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

      final hakkindaButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hakkinda()),
            );
          },
          child: Text("Hakkinda",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

      return Scaffold(
        appBar: AppBar(
          title: Text('Farket Hesaplı Alışveriş'),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 120.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  marketButon,
                  SizedBox(height: 25.0),
                  urunButon,
                  SizedBox(
                    height: 25.0,
                  ),
                  hakkindaButon,
                  SizedBox(
                    height: 25.0,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
}

