import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/user_model.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceControllerBase with _$ServiceController;

abstract class _ServiceControllerBase with Store {
  final _pokemonModel = PokemonModel(Dio());

  @observable
  Pokemon queryPokemon;

  @observable
  PokemonDetails pokemonDetails;

  @action
  Future<void> getQueryPokemon() async {
    final response = await _pokemonModel.getQueryPokemon();
    queryPokemon = response;
  }

  @action
  Future<void> getPokemonDetail(String name) async {
    final response = await _pokemonModel.getPokemonDetail(name);
    pokemonDetails = response;
  }
}
