import 'package:flutter/material.dart';
import 'package:lesson1/account/account.dart';
import 'package:lesson1/chats/chats.dart';
import 'package:lesson1/phone/phone.dart';
import 'package:lesson1/settings/settings.dart';

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
  int indexOfTab = 0;

  List<Widget> pages = const [
    AccountPage(),
    PhonePage(),
    ChatsPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello world!'),
      ),
      body: IndexedStack(
        index: indexOfTab,
        children: pages,
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.amber,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: indexOfTab,
          backgroundColor: const Color.fromARGB(255, 1, 27, 41),
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: const Color.fromARGB(255, 160, 159, 159),
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 35,
                ),
                label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.phone,
                  size: 35,
                ),
                label: 'Phone'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.forum,
                  size: 35,
                ),
                label: 'Forum'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_applications_sharp,
                  size: 35,
                ),
                label: 'Settings'),
          ],
          onTap: (value) {
            setState(() {
              indexOfTab = value;
            });
          },
        ),
      ),
    );
  }
}
