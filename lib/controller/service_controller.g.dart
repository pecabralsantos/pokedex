// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceController on _ServiceControllerBase, Store {
  final _$listUsersAtom = Atom(name: '_ServiceControllerBase.listUsers');

  @override
  ObservableList<User> get listUsers {
    _$listUsersAtom.reportRead();
    return super.listUsers;
  }

  @override
  set listUsers(ObservableList<User> value) {
    _$listUsersAtom.reportWrite(value, super.listUsers, () {
      super.listUsers = value;
    });
  }

  final _$userAtom = Atom(name: '_ServiceControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getListUsersAsyncAction =
      AsyncAction('_ServiceControllerBase.getListUsers');

  @override
  Future<void> getListUsers() {
    return _$getListUsersAsyncAction.run(() => super.getListUsers());
  }

  final _$saveUserAsyncAction = AsyncAction('_ServiceControllerBase.saveUser');

  @override
  Future saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  @override
  String toString() {
    return '''
listUsers: ${listUsers},
user: ${user}
    ''';
  }
}
