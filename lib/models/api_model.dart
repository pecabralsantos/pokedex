import 'package:dio/dio.dart';
import 'package:pokedex/models/repository/pokemon_repository.dart';
import 'package:retrofit/retrofit.dart';

part 'api_model.g.dart';

@RestApi(baseUrl: "")
abstract class ApiModel {
  factory ApiModel(Dio dio, {String baseUrl}) = _ApiModel;

  @GET("https://pokeapi.co/api/v2/pokemon")
  Future<ApiPokemon> getApiPokemon(
      @Query("limit") num limit, @Query("offset") num offset);

  @GET("{url}")
  Future<Pokemon> getPokemon(@Path('url') String url);
}