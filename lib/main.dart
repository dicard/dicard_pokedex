import 'package:flutter/material.dart';
import './src/widgets/home.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: PokedexHome(),
    );
  }
}

