import 'package:flutter/material.dart';

import 'infrastructure/utils/routes.dart';
import 'infrastructure/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: theme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
