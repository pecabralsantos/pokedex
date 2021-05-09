import 'package:mobx/mobx.dart';

part 'forms_controller.g.dart';

class FormsController = _FormsControllerBase with _$FormsController;

abstract class _FormsControllerBase with Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String phone;

  @observable
  String password;

  @action
  setName(String value) => name = value;

  @action
  setEmail(String value) => email = value;

  @action
  setPhone(String value) => phone = value;

  @action
  setPassword(String value) => password = value;

  @computed
  bool get registerIsValid {
    return validateRegister();
  }

  @computed
  bool get loginIsValid {
    return validateLogin();
  }

  bool validateRegister() {
    if ((name?.isEmpty ?? true) ||
        (email?.isEmpty ?? true) ||
        (phone?.toString()?.isEmpty ?? true) ||
        (password?.isEmpty ?? true)) {
      return false;
    }
    return true;
  }

  bool validateLogin() {
    if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
      return false;
    }
    return true;
  }
}
