// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    count: json['count'] as num,
    next: json['next'] as String,
    previous: json['previous'] as String,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ResultListPokemons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

ResultListPokemons _$ResultListPokemonsFromJson(Map<String, dynamic> json) {
  return ResultListPokemons(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ResultListPokemonsToJson(ResultListPokemons instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) {
  return PokemonDetails(
    id: json['id'] as num,
    name: json['name'] as String,
    sprites: json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Types.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    favorite: json['favorite'] as bool,
  );
}

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'types': instance.types,
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
        : Ability.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PokemonModel implements PokemonModel {
  _PokemonModel(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Pokemon> getQueryPokemon(limit, offset) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://pokeapi.co/api/v2/pokemon',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Pokemon.fromJson(_result.data);
    return value;
  }

  @override
  Future<PokemonDetails> getPokemonDetail(url) async {
    ArgumentError.checkNotNull(url, 'url');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('$url',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PokemonDetails.fromJson(_result.data);
    return value;
  }
}
