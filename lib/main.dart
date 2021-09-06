import 'package:dev_jayhackett_blogdemo/views/page/home_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/login_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/login_page_inheritedwidget.dart';
import 'package:dev_jayhackett_blogdemo/views/page/login_page_setstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/app_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [Provider.value(value: AppBloc())],
          child: LoginPage(
            appName: 'App Name',
          ),
        ));
  }
}
