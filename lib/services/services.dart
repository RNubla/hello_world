import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world/models/pokemons_model.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services.g.dart';

class ApiServices {
  String endpoint = 'https://pokeapi.co/api/v2/pokemon';
  Future<List<PokemonsModel>> getAllPokemons() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => PokemonsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

@riverpod
ApiService pokemon(PokemonProvider ref) => ref.watch(ApiServices());
// final pokemonProvider = Provider<ApiServices>((ref) => ApiServices());
