import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'infrastructure/utils/routes.dart';
import 'infrastructure/utils/theme.dart';

class App extends StatelessWidget {
  const App(this.userBox, {super.key});
  final Box userBox;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: theme,
      initialRoute:  AppRoutes.main,
      routes: appRoutes,
    );
  }
}
