import 'package:FlutterPokedex/app/modules/pokedex/pages/pokedex_controller.dart';
import 'package:FlutterPokedex/app/modules/pokedex/pages/pokedex_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:FlutterPokedex/app/bloc/pokedex_bloc.dart';
import 'package:FlutterPokedex/app/core/services/pokedex_service.dart';

class PokedexModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => PokedexController()),
    Bind((i) => PokedexBloc()),
    Bind((i) => PokedexService())
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (context, args) => const PokedexPage())
  ];
}