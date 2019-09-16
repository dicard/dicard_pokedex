import 'package:flutter/material.dart';
import './pokemon_list.dart';

class PokedexHome extends StatelessWidget {
  const PokedexHome();


  @override 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Center(
        child: PokemonList(),
      )
    );
  }
}



