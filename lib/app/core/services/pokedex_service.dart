import 'package:FlutterPokedex/app/bloc/pokedex_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:FlutterPokedex/app/core/models/pokemon_model.dart';
import 'package:FlutterPokedex/app/core/models/pokemon_details_model.dart';

import 'http_service.dart';

class PokedexService extends HttpService {
  final Dio _http = HttpService().instance;
  final PokedexBloc _bloc = Modular.get<PokedexBloc>();

  String nextPage = "";
  List<Pokemon> pokemonList = [];

  PokedexService() : super();

  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await _http.get('pokemon');

      String nextPageUrl = response.data['next'];

      if(nextPageUrl != "") {
        nextPage = nextPageUrl.substring(33);
      }

      final List<Pokemon> data = List<Pokemon>.from(response
          .data['results']
          .map((model) => Pokemon.fromJson(model)));

      if (response.statusCode == 200) {
        _bloc.setPokemons(data);
      }

      pokemonList = data;

      return data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Pokemon>> updatePokemons() async {
    try {
      List<Pokemon> data = pokemonList;
      for (Pokemon pokemon in data) {
        if (pokemon.details == null) {
          PokemonDetails details = await _getPokemonDetail(pokemon.name);
          pokemon.details = details;
          _bloc.setPokemons(data);
        }
      }

      pokemonList = data;

      return pokemonList;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Pokemon>> getMorePokemons() async {
    if (nextPage != "") {
      try {
        final response = await _http.get('pokemon/${nextPage}');

        String nextPageUrl = response.data['next'];

        if(nextPageUrl != "") {
          nextPage = nextPageUrl.substring(33);
        }

        final List<Pokemon> data = List<Pokemon>.from(response
            .data['results']
            .map((model) => Pokemon.fromJson(model)));

        if (response.statusCode == 200) {
          pokemonList.addAll(data);
          _bloc.setPokemons(pokemonList);
        }

        return pokemonList;
      } on DioError catch (e) {
        rethrow;
      }
    }
  }

  Future<PokemonDetails> _getPokemonDetail(String name) async {
    try {
      final response = await _http.get('pokemon/$name');

      if (response.statusCode == 200) {
        PokemonDetails data = PokemonDetails.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}