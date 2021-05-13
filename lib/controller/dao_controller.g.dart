// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DaoController on _DaoControllerBase, Store {
  final _$listUsersAtom = Atom(name: '_DaoControllerBase.listUsers');

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

  final _$userAtom = Atom(name: '_DaoControllerBase.user');

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

  final _$listFavoriteAtom = Atom(name: '_DaoControllerBase.listFavorite');

  @override
  ObservableList<Favorite> get listFavorite {
    _$listFavoriteAtom.reportRead();
    return super.listFavorite;
  }

  @override
  set listFavorite(ObservableList<Favorite> value) {
    _$listFavoriteAtom.reportWrite(value, super.listFavorite, () {
      super.listFavorite = value;
    });
  }

  final _$favoriteAtom = Atom(name: '_DaoControllerBase.favorite');

  @override
  Favorite get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(Favorite value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$getListUsersAsyncAction =
      AsyncAction('_DaoControllerBase.getListUsers');

  @override
  Future<void> getListUsers() {
    return _$getListUsersAsyncAction.run(() => super.getListUsers());
  }

  final _$getListFavoritesAsyncAction =
      AsyncAction('_DaoControllerBase.getListFavorites');

  @override
  Future<List<Favorite>> getListFavorites() {
    return _$getListFavoritesAsyncAction.run(() => super.getListFavorites());
  }

  final _$saveUserAsyncAction = AsyncAction('_DaoControllerBase.saveUser');

  @override
  Future saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  final _$saveFavoriteAsyncAction =
      AsyncAction('_DaoControllerBase.saveFavorite');

  @override
  Future saveFavorite(Favorite favorite) {
    return _$saveFavoriteAsyncAction.run(() => super.saveFavorite(favorite));
  }

  final _$deleteFavoriteAsyncAction =
      AsyncAction('_DaoControllerBase.deleteFavorite');

  @override
  Future deleteFavorite(Favorite favorite) {
    return _$deleteFavoriteAsyncAction
        .run(() => super.deleteFavorite(favorite));
  }

  @override
  String toString() {
    return '''
listUsers: ${listUsers},
user: ${user},
listFavorite: ${listFavorite},
favorite: ${favorite}
    ''';
  }
}
