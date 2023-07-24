import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iller_ve_ilceler/iller.dart';

void main(){
  runApp(selam());
}

class selam extends StatelessWidget {
  const selam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iller(),
    );
  }
}
