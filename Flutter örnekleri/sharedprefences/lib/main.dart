import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(maina());
}

class maina extends StatelessWidget {
  const maina({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: merhaba(),
    );
  }
}

class merhaba extends StatefulWidget {
  const merhaba({super.key});

  @override
  State<merhaba> createState() => _merhabaState();
}

class _merhabaState extends State<merhaba> {
  late SharedPreferences selam;
  TextEditingController yaziKontrol = TextEditingController();
  String kullaniciAdi = "";


  kaydet()async{
    selam = await SharedPreferences.getInstance();
    selam.setString("İsimler", yaziKontrol.text.toString());
  }

  Oku()async {
    selam = await SharedPreferences.getInstance();
    kullaniciAdi = selam.getString("İsimler") ?? "Boş veri";
    setState(() {
    });
  }


  Sil()async{
    selam = await SharedPreferences.getInstance();
    selam.remove("İsimler");
    kullaniciAdi = "";
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: yaziKontrol,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              kullaniciAdi,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  kaydet();
                },
                child: Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  Oku();
                },
                child: Text(
                  "Oku",
                  style: TextStyle(color: Colors.yellow),
                )),
            ElevatedButton(
                onPressed: () {
                  Sil();
                },
                child: Text(
                  "Sil",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.pink, title: Text("Nil"), centerTitle: true),
    );
  }
}
