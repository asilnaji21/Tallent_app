import 'package:flutter/material.dart';

import 'navigator.dart';
import 'resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.registerRoute,
      navigatorKey:
          NavigationConfiguration.navigationConfiguration.navigatorKey,
    );
  }
}
