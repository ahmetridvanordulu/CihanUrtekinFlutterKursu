import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vucutkitleendeksi/ana_sayfa.dart';

main(){
  runApp(sanadaselam());
}

class sanadaselam extends StatelessWidget {
  const sanadaselam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      home: selam(),
    );
  }
}
