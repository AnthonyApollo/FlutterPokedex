import 'package:FlutterPokedex/app/modules/pokedex/pages/pokedex_controller.dart';
import 'package:FlutterPokedex/app/core/models/pokemon_model.dart';
import 'package:FlutterPokedex/app/core/widgets/loader_widget.dart';
import 'package:FlutterPokedex/app/modules/pokedex/pages/widgets/loading_details_card.dart';
import 'package:FlutterPokedex/app/modules/pokedex/pages/widgets/pokemon_card.dart';
import 'package:FlutterPokedex/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends ModularState<PokedexPage, PokedexController> {
  Stream<List<Pokemon>> pokemonStream;
  List<Pokemon> pokemonList;

  ScrollController _scrollController;

  Stream<List<Pokemon>> _getPokemons() {
    setState(() {
      controller.isLoading = true;
    });

    controller.pokedexService.getPokemons().whenComplete(() {
      setState(() => controller.isLoading = false);
    });

    return controller.pokedexBloc.pokemons;
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.getMorePokemons().whenComplete(() => controller.updatePokemons());
    }
  }

  @override
  void initState() {
    super.initState();

    controller.initState();
    pokemonStream = controller.pokedexBloc.pokemons;

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    refresh();
  }

  void refresh() {
    setState(() {
      pokemonStream = _getPokemons();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: AppTheme.dark().accentColor,
      toolbarHeight: 45,
      title: new Center(
        child: new Text(
          'FlutterDex',
          textAlign: TextAlign.center,
          style: AppTheme.darkTextTheme.headline4,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _mainContent() {
    return Scaffold(
      backgroundColor: AppTheme.dark().primaryColor,
      appBar: _appBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          refresh();
        },
        child: StreamBuilder(
          stream: pokemonStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
            if (controller.isLoading) {
              return Center(child: Loader()); //loader
            }
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final Pokemon pokemon = snapshot.data[index];
                  if (pokemon.details == null) {
                    return LoadingDetailsCard(pokemon.name);
                  }
                  return PokemonCard(pokemon);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainContent();
  }
}