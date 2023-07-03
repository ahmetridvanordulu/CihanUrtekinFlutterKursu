import 'package:flutter/material.dart';

void main() {
  runApp(ilkOrnek());
}

class ilkOrnek extends StatefulWidget {
  ilkOrnek({super.key});

  @override
  State<ilkOrnek> createState() => _ilkOrnekState();
}

class _ilkOrnekState extends State<ilkOrnek> {
  int _sayac = 0;

  artir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("İlk ornegime hosgeldiniz"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(child: Text(_sayac.toString())),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.scatter_plot_outlined),
          onPressed: () {
            artir();
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
