import 'package:hello_world/models/pokemons_model.dart';
import 'package:hello_world/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_provider.g.dart';

@riverpod
Future<List<PokemonsModel>> fetchPokemonsData(FetchPokemonDataRef ref) async {
  return ref.watch(pokemonProvider).getAllPokemons();
}


// final pokemonsDataProvider = FutureProvider<List<PokemonsModel>>((ref) async {
//   return ref.watch(pokemonProvider).getAllPokemons();
// });
