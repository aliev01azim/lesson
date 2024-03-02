import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/routes.dart';
import 'package:lesson1/presentation/screens/home/home_page/home_page.dart';
import 'package:lesson1/presentation/screens/home/library_page/library_page.dart';
import 'package:lesson1/presentation/screens/home/search_page/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List page = const [
    HomePage(),
    SearchPage(),
    LibraryPage(),
  ];

  int currerntIndex = 0;
  void onTap(int index) {
    currerntIndex = index;
    setState(() {});
  }

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
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.main, (Route route) => false);
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: page[currerntIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currerntIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
