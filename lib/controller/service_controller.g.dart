// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceController on _ServiceControllerBase, Store {
  final _$pokemonsAtom = Atom(name: '_ServiceControllerBase.pokemons');

  @override
  ObservableList<PokemonDetails> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonDetails> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$listPokemonsDetailsAtom =
      Atom(name: '_ServiceControllerBase.listPokemonsDetails');

  @override
  List<Future<PokemonDetails>> get listPokemonsDetails {
    _$listPokemonsDetailsAtom.reportRead();
    return super.listPokemonsDetails;
  }

  @override
  set listPokemonsDetails(List<Future<PokemonDetails>> value) {
    _$listPokemonsDetailsAtom.reportWrite(value, super.listPokemonsDetails, () {
      super.listPokemonsDetails = value;
    });
  }

  final _$getQueryPokemonAsyncAction =
      AsyncAction('_ServiceControllerBase.getQueryPokemon');

  @override
  Future<void> getQueryPokemon() {
    return _$getQueryPokemonAsyncAction.run(() => super.getQueryPokemon());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
listPokemonsDetails: ${listPokemonsDetails}
    ''';
  }
}
