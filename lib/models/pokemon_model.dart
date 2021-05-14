import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_model.g.dart';

@RestApi(baseUrl: "")
abstract class PokemonModel {
  factory PokemonModel(Dio dio, {String baseUrl}) = _PokemonModel;

  @GET("https://pokeapi.co/api/v2/pokemon")
  Future<Pokemon> getQueryPokemon(
      @Query("limit") num limit, @Query("offset") num offset);

  @GET("{url}")
  Future<PokemonDetails> getPokemonDetail(@Path('url') String url);
}

@JsonSerializable()
class Pokemon {
  num count;
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
  num id;
  String name;
  @JsonKey(name: "base_experience")
  num baseExperience;
  num height;
  num weight;
  num order;
  Sprites sprites;
  List<Types> types;
  Ability species;

  // List<Abilities> abilities;
  // List<Stats> stats;
  bool favorite;

  PokemonDetails({
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

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);
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
  Ability type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Ability {
  String name;

  Ability({this.name});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
