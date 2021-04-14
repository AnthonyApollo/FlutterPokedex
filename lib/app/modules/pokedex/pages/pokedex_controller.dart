import 'package:FlutterPokedex/app/bloc/pokedex_bloc.dart';
import 'package:FlutterPokedex/app/core/services/pokedex_service.dart';
import 'package:FlutterPokedex/app/core/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokedexController extends Disposable {
  final PageController pageController = PageController();
  final PokedexBloc pokedexBloc = Modular.get<PokedexBloc>();
  final PokedexService pokedexService = Modular.get<PokedexService>();

  bool isLoading = false;

  Future<List<Pokemon>> getPokemons() {
    return pokedexService.getPokemons();
  }

  Future<List<Pokemon>> updatePokemons() {
    isLoading = false;
    return pokedexService.updatePokemons();
  }

  Future<List<Pokemon>> getMorePokemons() {
    return pokedexService.getMorePokemons();
  }

  void initState() {
    isLoading = true;
    getPokemons().whenComplete(() => updatePokemons());
  }

  @override
  void dispose() {
    pageController.dispose();
  }
}