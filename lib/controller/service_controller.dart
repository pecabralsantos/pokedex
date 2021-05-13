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
  ObservableList<PokemonDetails> pokemons = ObservableList();

  @observable
  List<Future<PokemonDetails>> listPokemonsDetails = [];

  @action
  Future<void> getQueryPokemon() async {
    final response = await _pokemonModel.getQueryPokemon(4, 0).then((v) async {
      v.results.forEach((e) {
        listPokemonsDetails.add(_pokemonModel.getPokemonDetail(e.url));
      });
      return Future.wait(listPokemonsDetails);
    });
    final favoritePokemons = await _daoController.getListFavorites();
    for (var favorite in favoritePokemons) {
      for (int i = 0; i < response.length; i++) {
        if (favorite.namePokemon == response[i].name) {
          response[i].favorite = true;
        }
      }
    }
    pokemons = response.asObservable();
  }
}
