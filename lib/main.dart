import 'package:dev_jayhackett_blogdemo/router/app_route_parser.dart';
import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider.value(value: AppRouteInformationParser()),
    ChangeNotifierProvider(
      create: (_) => AppRouterDelegate(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser:
          Provider.of<AppRouteInformationParser>(context, listen: false),
      routerDelegate: Provider.of<AppRouterDelegate>(context, listen: false),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
    );
  }
}
