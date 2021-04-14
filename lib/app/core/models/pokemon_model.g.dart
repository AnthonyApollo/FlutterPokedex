part of 'pokemon_model.dart';

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    name: json['name'] as String
  );
}