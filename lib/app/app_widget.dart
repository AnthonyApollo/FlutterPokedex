import 'package:FlutterPokedex/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'FlutterPokedex',
      theme: AppTheme.dark(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}