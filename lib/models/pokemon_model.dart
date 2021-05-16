import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_model.g.dart';

@RestApi(baseUrl: "")
abstract class PokemonModel {
  factory PokemonModel(Dio dio, {String baseUrl}) = _PokemonModel;

  @GET("https://pokeapi.co/api/v2/pokemon")
  Future<ApiPokemon> getApiPokemon(
      @Query("limit") num limit, @Query("offset") num offset);

  @GET("{url}")
  Future<Pokemon> getPokemon(@Path('url') String url);
}

@JsonSerializable()
class ApiPokemon {
  num count;
  String next;
  String previous;
  List<ResultApiPokemon> results;

  ApiPokemon({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ApiPokemon.fromJson(Map<String, dynamic> json) =>
      _$ApiPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPokemonToJson(this);
}

@JsonSerializable()
class ResultApiPokemon {
  String name;
  String url;

  ResultApiPokemon({
    this.name,
    this.url,
  });

  factory ResultApiPokemon.fromJson(Map<String, dynamic> json) =>
      _$ResultApiPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$ResultApiPokemonToJson(this);
}

@JsonSerializable()
class Pokemon {
  num id;
  String name;
  @JsonKey(name: "base_experience")
  num baseExperience;
  num height;
  num weight;
  num order;
  Sprites sprites;
  List<Types> types;
  // List<Abilities> abilities;
  // List<Stats> stats;
  bool favorite;
  // Ability species;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.order,
    this.sprites,
    this.types,
    this.favorite,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprites {
  Other other;

  Sprites({this.other});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Other {
  @JsonKey(name: "dream_world")
  DreamWorld dreamWorld;

  Other({this.dreamWorld});

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable()
class DreamWorld {
  @JsonKey(name: "front_default")
  String frontDefault;

  DreamWorld({this.frontDefault});

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}

@JsonSerializable()
class Types {
  num slot;
  Type type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Type {
  String name;

  Type({this.name});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
