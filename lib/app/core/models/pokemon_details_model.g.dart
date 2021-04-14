part of 'pokemon_details_model.dart';

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) {
  return PokemonDetails(
    id: json['id'] as int,
    urlImg: json['sprites']['front_default'] as String,
    types: json['types'] as List<dynamic>,
  );
}