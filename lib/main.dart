import 'dart:math';

import 'package:flutter/material.dart';

final _key = GlobalKey<_MyTextWidgetState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(key: _key),
        const MyTextWidget(key: ValueKey('3')),
        ElevatedButton(
          onPressed: () => _key.currentState
              ?.render2(), //Как вот здесь пробраться к методу render?
          child: const Text('Нажми меня'),
        )
      ],
    ));
  }
}

class MyTextWidget extends StatefulWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  State<MyTextWidget> createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  void render() {
    setState(() {});
  }

  void render2() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final number = Random().nextInt(100);
    return Text(
      '$number',
      style: const TextStyle(fontSize: 40),
    );
  }
}
