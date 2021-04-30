import 'package:flutter/material.dart';
import 'package:farket/models/urun.dart';
import 'package:farket/utils/dbHelper.dart';

class UrunHomePage extends StatefulWidget {
  @override
  _UrunHomePageState createState() => _UrunHomePageState();
}

class _UrunHomePageState extends State<UrunHomePage> {

  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Uruns> allUruns = List<Uruns>();

  var _controllerAdi = TextEditingController();
  var _controllerAciklama = TextEditingController();
  var _controllerResimYolu = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  int clickedUrunID;

  void getUruns() async {
    var urunsFuture = _databaseHelper.getAllUruns();
    await urunsFuture.then((data) {
      setState(() {
        this.allUruns = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUruns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ürünlerim"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                buildForm(_controllerAdi, "Ürün Adı"),
                buildForm(_controllerAciklama, "Açıklama"),
                buildForm(_controllerResimYolu, "Resim Yolu")
              ])),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("Kaydet", Colors.green, saveObject),
                buildButton("Güncelle", Colors.yellow, updateObject)
              ]),
          Expanded(
              child: ListView.builder(
                  itemCount: allUruns.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            onTap: () {
                              setState(() {
                                _controllerAdi.text = allUruns[index].adi;
                                _controllerAciklama.text =
                                    allUruns[index].aciklama;
                                _controllerResimYolu.text =
                                    allUruns[index].resimyolu;
                                clickedUrunID = allUruns[index].id;
                              });
                            },

                            title: Text(allUruns[index].adi),
                            subtitle: Text(allUruns[index].aciklama),
                            //subtitle: Text(allUruns[index].resimyolu),
                            trailing: GestureDetector(
                              onTap: () {
                                _deleteUrun(allUruns[index].id, index);
                              },
                              child: Icon(Icons.delete),
                            )));
                  }))
        ])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
                InputDecoration(labelText: str, border: OutlineInputBorder())));
  }

  Widget buildButton(String str, Color buttonColor, Function eventFunc) {
    return ElevatedButton(
      child: Text(str),
      // color: buttonColor,
      onPressed: () {
        eventFunc();
      },
    );
  }

  void updateObject() {
    if (clickedUrunID != null) {
      if (_formKey.currentState.validate()) {
        _uptadeUrun(Uruns.withId(
            clickedUrunID, _controllerAdi.text, _controllerAciklama.text,_controllerResimYolu.text));
      }
    } else {
      alert();
    }
  }

  void saveObject() {
    if (_formKey.currentState.validate()) {
      _addUrun(Uruns(_controllerAdi.text, _controllerAciklama.text, _controllerResimYolu.text));
    }
  }

  void alert() {
    AlertDialog alert = AlertDialog(
      title: Text("Seçili Ürün Yok!"),
      content: Text("Lütfen bir ürün seçerek güncelleme işlemi yapınız!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Crud İşlemlerinin AraYüze Uygulanması

  void _addUrun(Uruns urun) async {
    await _databaseHelper.insert(urun);

    setState(() {
      getUruns();
      _controllerAdi.text = "";
      _controllerAciklama.text = "";
      _controllerResimYolu.text = "";
    });
  }

  void _uptadeUrun(Uruns urun) async {
    await _databaseHelper.update(urun);

    setState(() {
      getUruns();
      _controllerAdi.text = "";
      _controllerAciklama.text = "";
      _controllerResimYolu.text = "";
      clickedUrunID = null;
    });
  }

  void _deleteUrun(int deletedUrunId, int deletedUrunIndex) async {
    await _databaseHelper.delete(deletedUrunId);

    setState(() {
      getUruns();
    });
  }
}
