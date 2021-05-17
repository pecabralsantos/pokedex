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

  final _$listPokemonsAtom = Atom(name: '_ServiceControllerBase.listPokemons');

  @override
  ObservableList<Pokemon> get listPokemons {
    _$listPokemonsAtom.reportRead();
    return super.listPokemons;
  }

  @override
  set listPokemons(ObservableList<Pokemon> value) {
    _$listPokemonsAtom.reportWrite(value, super.listPokemons, () {
      super.listPokemons = value;
    });
  }

  final _$listFavoriteAtom = Atom(name: '_ServiceControllerBase.listFavorite');

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

  final _$saveUserAsyncAction = AsyncAction('_ServiceControllerBase.saveUser');

  @override
  Future saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  final _$getListUsersAsyncAction =
      AsyncAction('_ServiceControllerBase.getListUsers');

  @override
  Future<void> getListUsers() {
    return _$getListUsersAsyncAction.run(() => super.getListUsers());
  }

  final _$getApiPokemonAsyncAction =
      AsyncAction('_ServiceControllerBase.getApiPokemon');

  @override
  Future<void> getApiPokemon() {
    return _$getApiPokemonAsyncAction.run(() => super.getApiPokemon());
  }

  final _$getListFavoritesAsyncAction =
      AsyncAction('_ServiceControllerBase.getListFavorites');

  @override
  Future<List<Favorite>> getListFavorites() {
    return _$getListFavoritesAsyncAction.run(() => super.getListFavorites());
  }

  final _$saveFavoriteAsyncAction =
      AsyncAction('_ServiceControllerBase.saveFavorite');

  @override
  Future saveFavorite(Favorite favorite) {
    return _$saveFavoriteAsyncAction.run(() => super.saveFavorite(favorite));
  }

  final _$deleteFavoriteAsyncAction =
      AsyncAction('_ServiceControllerBase.deleteFavorite');

  @override
  Future deleteFavorite(Favorite favorite) {
    return _$deleteFavoriteAsyncAction
        .run(() => super.deleteFavorite(favorite));
  }

  @override
  String toString() {
    return '''
listUsers: ${listUsers},
listPokemons: ${listPokemons},
listFavorite: ${listFavorite}
    ''';
  }
}
