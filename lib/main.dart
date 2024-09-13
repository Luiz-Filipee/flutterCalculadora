import 'package:calculadoraapp/widget/corpo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final String _title = "Calculadora";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: Text(_title),
        ),
        body: Corpo(),
      ),
    );
  }
}
