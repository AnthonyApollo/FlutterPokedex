import 'package:FlutterPokedex/app/themes/app_theme.dart';
import 'package:FlutterPokedex/app/themes/pokemon_type.dart';
import 'package:FlutterPokedex/app/core/models/pokemon_model.dart';
import 'package:FlutterPokedex/app/themes/string_theme.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final PokemonType pkmType = PokemonType();
    final availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final availableWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '#${pokemon.details.id.toString().padLeft(3, '0')}',
                style: AppTheme.darkTextTheme.subtitle1,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                pokemon.name.capitalize(),
                style: AppTheme.darkTextTheme.headline1,
              ),
            ),
            Image(
              image: NetworkImage(pokemon.details.urlImg),
              height: availableHeight * 0.3,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: pkmType.pokemonType(
                  pokemon.details.types, availableWidth),
            )
          ],
        ),
      ),
    );
  }
}