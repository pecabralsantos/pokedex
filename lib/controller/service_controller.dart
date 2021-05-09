import 'package:mobx/mobx.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/models/user_model.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceControllerBase with _$ServiceController;

abstract class _ServiceControllerBase with Store {
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
