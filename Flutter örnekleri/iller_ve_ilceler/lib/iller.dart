import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ve_ilceler/Ilce.dart';
import 'package:iller_ve_ilceler/il.dart';

class Iller extends StatefulWidget {
  @override
  State<Iller> createState() => _IllerState();
}

class _IllerState extends State<Iller> {
  List<Il> _tumIller = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _jsonCozumleme();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text("Json"),
      ),
      body: ListView.builder(
          itemCount: _tumIller.length, itemBuilder: _listelerim),
    );
  }

  Widget? _listelerim(BuildContext context, int indexDegeri) {
    Il il = _tumIller[indexDegeri];

    return Card(
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(il.isim!),
            Text(il.plakaKodu!),
          ],
        ),
        leading: Icon(Icons.add_alarm_sharp),
        children: il.ilceler.map((ilce){
          return ListTile(
          title: Text(ilce.name!),
          );
    }).toList(),


      ),
    );
  }

  _jsonCozumleme() async {
    try {
      String jsonString =
          await rootBundle.loadString("assets/iller_ilceler.json");
      Map<String, dynamic> illerMap = jsonDecode(jsonString);

      for (String plakaKodu in illerMap.keys) {
        Map<String, dynamic> ilMap = illerMap[plakaKodu];
        String ilIsmi = ilMap["name"];
        Map<String, dynamic> ilcelerMap = ilMap["districts"];

        List<Ilce> tumIlceler = [];

        for (String ilceKodu in ilcelerMap.keys) {
          Map<String, dynamic> ilceMap = ilcelerMap[ilceKodu];
          Ilce ilce = Ilce(ilceMap["name"]);
          tumIlceler.add(ilce);
        }
        Il il = Il(ilIsmi, plakaKodu, tumIlceler);
        _tumIller.add(il);
      }
      setState(() {});
    } catch (x) {
      print("Hata !! hata = ${x.toString()}");
    }
  }
}
