import 'package:FlutterPokedex/app/app_widget.dart';
import 'package:FlutterPokedex/app/modules/pokedex/pokedex_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, module: PokedexModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}