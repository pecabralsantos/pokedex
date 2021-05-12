import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_model.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class PokemonModel {
  factory PokemonModel(Dio dio, {String baseUrl}) = _PokemonModel;

  @GET("/pokemon")
  Future<Pokemon> getQueryPokemon();

  @GET("/pokemon/{name}")
  Future<PokemonDetails> getPokemonDetail(@Path('name') String name);
}

@JsonSerializable()
class Pokemon {
  int count;
  String next;
  String previous;
  List<ResultListPokemons> results;

  Pokemon({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class ResultListPokemons {
  String name;
  String url;

  ResultListPokemons({
    this.name,
    this.url,
  });

  factory ResultListPokemons.fromJson(Map<String, dynamic> json) =>
      _$ResultListPokemonsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultListPokemonsToJson(this);
}

@JsonSerializable()
class PokemonDetails {
  int id;
  String name;
  int height;

  PokemonDetails({
    this.id,
    this.name,
    this.height,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);
}
