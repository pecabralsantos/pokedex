import 'package:json_annotation/json_annotation.dart';

part 'pokemon_repository.g.dart';

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
  List<Abilities> abilities;
  List<Stats> stats;
  bool favorite;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.order,
    this.sprites,
    this.types,
    this.abilities,
    this.stats,
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

@JsonSerializable()
class Abilities {
  num slot;
  @JsonKey(name: "is_hidden")
  bool isHidden;
  Ability ability;

  Abilities({this.slot, this.isHidden, this.ability});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  String name;
  String url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: "base_stat")
  num baseStat;
  Stat stat;

  Stats({this.baseStat, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Stat {
  String name;

  Stat({this.name});

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
