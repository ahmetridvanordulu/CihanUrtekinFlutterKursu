import 'package:flutter/material.dart';

class selam extends StatefulWidget {

  @override
  State<selam> createState() => _selamState();
}

class _selamState extends State<selam> {
  double sonuc = 0.0;

  TextEditingController b1 = TextEditingController();

  TextEditingController k1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Vücut kitle endeksi",),centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48,horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(sonuc.toStringAsFixed(2),style: TextStyle(fontSize: 50)),
            TextField(

              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Boy",suffixText: "m"),
              controller: b1,
              keyboardType: TextInputType.number,

            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),labelText: "Kilo",suffixText: "kg"),
              controller: k1,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: Size(100 , 100)),onPressed: () {
hesapla();
            }, child: Text("Hesapla"))
          ],
        ),
      ),
    );

  }

  hesapla(){
    String boyYazisi = b1.text.trim();
    String kiloText = k1.text.trim();

    try{
      double cevrilenboy = double.parse(boyYazisi);
      double cevrilenkilo = double.parse(kiloText);

      setState(() {
        sonuc = cevrilenkilo / (cevrilenboy * cevrilenboy);
      });
      print("Hesaplandı");
    }catch (error){
      print("Hatalı işlem yapıldı.");
    }
    }
}
