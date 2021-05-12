// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    count: json['count'] as int,
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
    id: json['id'] as int,
    name: json['name'] as String,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PokemonModel implements PokemonModel {
  _PokemonModel(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://pokeapi.co/api/v2/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Pokemon> getQueryPokemon() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/pokemon',
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
  Future<PokemonDetails> getPokemonDetail(name) async {
    ArgumentError.checkNotNull(name, 'name');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/pokemon/$name',
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
