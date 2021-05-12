// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceController on _ServiceControllerBase, Store {
  final _$queryPokemonAtom = Atom(name: '_ServiceControllerBase.queryPokemon');

  @override
  Pokemon get queryPokemon {
    _$queryPokemonAtom.reportRead();
    return super.queryPokemon;
  }

  @override
  set queryPokemon(Pokemon value) {
    _$queryPokemonAtom.reportWrite(value, super.queryPokemon, () {
      super.queryPokemon = value;
    });
  }

  final _$pokemonDetailsAtom =
      Atom(name: '_ServiceControllerBase.pokemonDetails');

  @override
  PokemonDetails get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(PokemonDetails value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  final _$getQueryPokemonAsyncAction =
      AsyncAction('_ServiceControllerBase.getQueryPokemon');

  @override
  Future<void> getQueryPokemon() {
    return _$getQueryPokemonAsyncAction.run(() => super.getQueryPokemon());
  }

  final _$getPokemonDetailAsyncAction =
      AsyncAction('_ServiceControllerBase.getPokemonDetail');

  @override
  Future<void> getPokemonDetail(String name) {
    return _$getPokemonDetailAsyncAction
        .run(() => super.getPokemonDetail(name));
  }

  @override
  String toString() {
    return '''
queryPokemon: ${queryPokemon},
pokemonDetails: ${pokemonDetails}
    ''';
  }
}
