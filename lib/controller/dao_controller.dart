import 'package:mobx/mobx.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/models/user_model.dart';

part 'dao_controller.g.dart';

class DaoController = _DaoControllerBase with _$DaoController;

abstract class _DaoControllerBase with Store {
  final _userDao = UserDAO();

  @observable
  ObservableList<User> listUsers = ObservableList();

  @observable
  User user;

  @action
  Future<void> getListUsers() async {
    final response = await _userDao.getList();
    listUsers = response.asObservable();
  }

  @action
  saveUser(User user) async {
    await _userDao.save(user);
  }
}
