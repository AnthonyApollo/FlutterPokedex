import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_model.g.dart';

@JsonSerializable(nullable: false)
class PokemonDetails {
  int id;
  String urlImg;
  List<dynamic> types;

  PokemonDetails(
    {this.id,
    this.urlImg,
    this.types}
  );

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);
}