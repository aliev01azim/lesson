import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lesson1/presentation/screens/auth/login/bloc/login_bloc.dart';

import 'infrastructure/utils/routes.dart';
import 'infrastructure/utils/theme.dart';

class App extends StatelessWidget {
  const App(this.userBox, {super.key});
  final Box userBox;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: theme,
        initialRoute: AppRoutes.main,
        routes: appRoutes,
      ),
    );
  }
}
