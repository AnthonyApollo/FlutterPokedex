import 'package:FlutterPokedex/app/core/widgets/skeleton_loader.dart';
import 'package:FlutterPokedex/app/themes/app_theme.dart';
import 'package:FlutterPokedex/app/themes/pokemon_type.dart';
import 'package:FlutterPokedex/app/themes/string_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailsCard extends StatelessWidget {
  final String pokemonName;

  const LoadingDetailsCard(this.pokemonName);

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
              child: SkeletonLoader(21, 75)
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                pokemonName.capitalize(),
                style: AppTheme.darkTextTheme.headline1,
              ),
            ),
            SkeletonLoader(availableHeight * 0.3, availableWidth),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(21, 100),
                SizedBox(width: 16),
                SkeletonLoader(21, 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}