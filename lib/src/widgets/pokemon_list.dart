import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class PokemonList extends StatefulWidget {
  @override 
  PokemonListState createState() => PokemonListState();
}

class PokemonListState extends State<PokemonList> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new FutureBuilder<List>(
          future: _getPokemons(),
          builder: (context, pokemons) {
            return _listBuild(pokemons);
          }
        ),
      ),
    );
  }


  Future<List> _getPokemons() async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=1000');
    
    final responseJson = jsonDecode(response.body);
    
    List pokemons = responseJson['results'];

    // List<Pokemon> pokemons = _createPokemonList(responseJson['results']);
    return pokemons;
  }

  // List<Pokemon> _createPokemonList(List pokemons) {
  //   List<Pokemon> list = new List();

  //   for (int i = 0; i < pokemons.length; i++) {

  //     String pokemonName = pokemons[i]['name'];
  //     String pokemonUrl = pokemons[i]['url'];

  //     Pokemon pokemon = new Pokemon(
  //       name: pokemonName,
  //       url: pokemonUrl
  //     );
  //     list.add(pokemon);
  //   };

  //   return list;
  // }

 Widget _listBuild(pokemons) {
   return new ListView.builder(
     itemCount: pokemons.data.length,
     itemBuilder: (BuildContext context, int index) {
       return _buildRow(pokemons.data[index]);
     },
   );
 }

 Widget _buildRow(pokemon) {

  var splittedPokemonUrl = pokemon['url'].split('/');
  
  var idIndex = splittedPokemonUrl.length - 2;
  var test = splittedPokemonUrl[idIndex];

  return ListTile(
    title: Text(pokemon['name']),
    trailing: Text('id : ' + test),
   );
 }
  
}
