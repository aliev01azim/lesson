import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userBox = Hive.box(Boxes.userBox);
  @override
  Widget build(BuildContext context) {
    print('ключи - ${userBox.keys}');
    print('значения - ${userBox.values}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
              onPressed: () async {
                await userBox.clear();
                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.main,(Route route) => false);
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text('HOME PAGGGGGGGE'),
      ),
    );
  }
}
