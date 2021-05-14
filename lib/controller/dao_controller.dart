import 'package:mobx/mobx.dart';
import 'package:pokedex/database/dao/favorite_dao.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/models/favorite_model.dart';
import 'package:pokedex/models/user_model.dart';

part 'dao_controller.g.dart';

class DaoController = _DaoControllerBase with _$DaoController;

abstract class _DaoControllerBase with Store {
  final _userDao = UserDAO();
  final _favoriteDao = FavoriteDAO();

  @observable
  ObservableList<User> listUsers = ObservableList();

  @observable
  User user;

  @observable
  ObservableList<Favorite> listFavorite = ObservableList();

  @observable
  Favorite favorite;

  @action
  Future<void> getListUsers() async {
    final response = await _userDao.getList();
    listUsers = response.asObservable();
  }

  @action
  Future<List<Favorite>> getListFavorites() async {
    final response = await _favoriteDao.getList();
    listFavorite = response.asObservable();
    return listFavorite;
  }

  @action
  saveUser(User user) async {
    await _userDao.save(user);
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
