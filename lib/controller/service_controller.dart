import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon_model.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceControllerBase with _$ServiceController;

abstract class _ServiceControllerBase with Store {
  final _pokemonModel = PokemonModel(Dio());

  @observable
  List<PokemonDetails> pokemons;

  @observable
  List<Future<PokemonDetails>> listPokemonsDetails = [];

  @action
  Future<void> getQueryPokemon() async {
    final response = await _pokemonModel.getQueryPokemon(20, 0).then((v) {
      v.results.forEach((e) {
        listPokemonsDetails.add(_pokemonModel.getPokemonDetail(e.url));
      });
      return Future.wait(listPokemonsDetails);
    });
    pokemons = response;
  }
}
