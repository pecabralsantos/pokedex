// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPokemon _$ApiPokemonFromJson(Map<String, dynamic> json) {
  return ApiPokemon(
    count: json['count'] as num,
    next: json['next'] as String,
    previous: json['previous'] as String,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ResultApiPokemon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ApiPokemonToJson(ApiPokemon instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

ResultApiPokemon _$ResultApiPokemonFromJson(Map<String, dynamic> json) {
  return ResultApiPokemon(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ResultApiPokemonToJson(ResultApiPokemon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as num,
    name: json['name'] as String,
    baseExperience: json['base_experience'] as num,
    height: json['height'] as num,
    weight: json['weight'] as num,
    order: json['order'] as num,
    sprites: json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Types.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    abilities: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Abilities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stats: (json['stats'] as List)
        ?.map(
            (e) => e == null ? null : Stats.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    favorite: json['favorite'] as bool,
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'order': instance.order,
      'sprites': instance.sprites,
      'types': instance.types,
      'abilities': instance.abilities,
      'stats': instance.stats,
      'favorite': instance.favorite,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) {
  return Sprites(
    other: json['other'] == null
        ? null
        : Other.fromJson(json['other'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'other': instance.other,
    };

Other _$OtherFromJson(Map<String, dynamic> json) {
  return Other(
    dreamWorld: json['dream_world'] == null
        ? null
        : DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'dream_world': instance.dreamWorld,
    };

DreamWorld _$DreamWorldFromJson(Map<String, dynamic> json) {
  return DreamWorld(
    frontDefault: json['front_default'] as String,
  );
}

Map<String, dynamic> _$DreamWorldToJson(DreamWorld instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

Types _$TypesFromJson(Map<String, dynamic> json) {
  return Types(
    slot: json['slot'] as num,
    type: json['type'] == null
        ? null
        : Type.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) {
  return Type(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) {
  return Abilities(
    slot: json['slot'] as num,
    isHidden: json['is_hidden'] as bool,
    ability: json['ability'] == null
        ? null
        : Ability.fromJson(json['ability'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'slot': instance.slot,
      'is_hidden': instance.isHidden,
      'ability': instance.ability,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    baseStat: json['base_stat'] as num,
    stat: json['stat'] == null
        ? null
        : Stat.fromJson(json['stat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

Stat _$StatFromJson(Map<String, dynamic> json) {
  return Stat(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
    };
