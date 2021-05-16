import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceControllerBase with _$ServiceController;

abstract class _ServiceControllerBase with Store {
  final _pokemonModel = PokemonModel(Dio());
  final _daoController = DaoController();

  @observable
  ObservableList<Pokemon> listPokemons = ObservableList();

  @action
  Future<void> getApiPokemon() async {
    final response = await _pokemonModel.getApiPokemon(8, 0).then((v) {
      final pokemon = <Future<Pokemon>>[];
      v.results.forEach((e) {
        pokemon.add(_pokemonModel.getPokemon(e.url));
      });
      return Future.wait(pokemon);
    });
    final favoritePokemon = await _daoController.getListFavorites();
    for (var favorite in favoritePokemon) {
      for (int i = 0; i < response.length; i++) {
        if (favorite.namePokemon == response[i].name) {
          response[i].favorite = true;
        }
      }
    }
    listPokemons = response.asObservable();
  }
}
