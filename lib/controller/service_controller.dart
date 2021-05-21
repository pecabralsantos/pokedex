import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/database/dao/favorite_dao.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/models/api_model.dart';
import 'package:pokedex/models/repository/favorite_repository.dart';
import 'package:pokedex/models/repository/pokemon_repository.dart';
import 'package:pokedex/models/repository/user_repository.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceControllerBase with _$ServiceController;

abstract class _ServiceControllerBase with Store {
  final _apiModel = ApiModel(Dio());
  final _userDao = UserDAO();
  final _favoriteDao = FavoriteDAO();

  @observable
  ObservableList<User> listUsers = ObservableList();

  @observable
  ObservableList<Pokemon> listPokemons = ObservableList();

  @observable
  ObservableList<Favorite> listFavorite = ObservableList();

  @action
  saveUser(User user) async {
    await _userDao.save(user);
  }

  @action
  Future<void> getListUsers() async {
    final response = await _userDao.getList();
    listUsers = response.asObservable();
  }

  @action
  Future<void> getApiPokemon() async {
    final response = await _apiModel.getApiPokemon(150, 0).then((v) {
      final pokemon = <Future<Pokemon>>[];
      v.results.forEach((e) {
        pokemon.add(_apiModel.getPokemon(e.url));
      });
      return Future.wait(pokemon);
    });
    final favoritePokemon = await getListFavorites();
    for (var favorite in favoritePokemon) {
      for (int i = 0; i < response.length; i++) {
        if (favorite.namePokemon == response[i].name) {
          response[i].favorite = true;
        }
      }
    }
    listPokemons = response.asObservable();
  }

  @action
  Future<List<Favorite>> getListFavorites() async {
    final response = await _favoriteDao.getList();
    listFavorite = response.asObservable();
    return listFavorite;
  }

  @action
  saveFavorite(Favorite favorite) async {
    await _favoriteDao.save(favorite);
  }

  @action
  deleteFavorite(Favorite favorite) async {
    await _favoriteDao.delete(favorite);
  }
}
