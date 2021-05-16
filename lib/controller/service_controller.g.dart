// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceController on _ServiceControllerBase, Store {
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

  final _$_pokemonAtom = Atom(name: '_ServiceControllerBase._pokemon');

  @override
  List<Future<Pokemon>> get _pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  set _pokemon(List<Future<Pokemon>> value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  final _$getApiPokemonAsyncAction =
      AsyncAction('_ServiceControllerBase.getApiPokemon');

  @override
  Future<void> getApiPokemon() {
    return _$getApiPokemonAsyncAction.run(() => super.getApiPokemon());
  }

  @override
  String toString() {
    return '''
listPokemons: ${listPokemons}
    ''';
  }
}
