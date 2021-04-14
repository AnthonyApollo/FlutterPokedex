import 'package:FlutterPokedex/app/core/models/pokemon_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(nullable: false)
class Pokemon {
  String name;
  PokemonDetails details;

  Pokemon({this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}