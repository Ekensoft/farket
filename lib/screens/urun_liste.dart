import 'package:flutter/material.dart';
import 'package:farket/screens/market_detay.dart';

class UrunListe extends StatefulWidget {
  @override
  _UrunListeState createState() => _UrunListeState();
}

class _UrunListeState extends State<UrunListe> {
  List<Widget> urunlerListe;

  @override
  void initState() {
    super.initState();
    urunlerListe = [
      urunKarti(
        "Rize Turist Çay",
        "Çaykur Rize Turist 1000 G",
        "assets/urun/rizeturistcay.jpg",
      ),
      urunKarti(
        "Toz Şeker",
        "Doğuş 5000 G",
        "assets/urun/tozseker.jpg",
      ),
      urunKarti(
        "Filiz Çay",
        "Çaykur Doğuş 1000 G",
        "assets/urun/filizcay.jpg",
      ),
      urunKarti(
        "Pınar Süt",
        "Pınar Süt 500 G",
        "assets/urun/pinarsut500.jpg",
      ),
      urunKarti(
        "Tahin Helva",
        "Koska 400 G",
        "assets/urun/tahinhelva.jpg",
      ),
      urunKarti(
        "Zeytin",
        "Marmara Birlik 500 G",
        "assets/urun/zeytin.jpg",
      ),

    ];
  }

  Widget urunKarti(String isim, String aciklama, String resimYolu) {
    return GestureDetector(
      /*
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MarketDetay(
                      isim: isim,
                      aciklama: aciklama,
                      resimYolu: resimYolu,
                    )));
      },*/
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: resimYolu,
              child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(resimYolu),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(isim,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                )),
            SizedBox(
              height: 8.0,
            ),
            Text(aciklama,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farket-Urunler'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 1,
        children: urunlerListe,
      ),
    );
  }
}
