import 'package:flutter/material.dart';

import 'api_client.dart';

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
  List<dynamic> posts = [];
  @override
  void initState() {
    getPosts();
    super.initState();
  }
  void getPosts() async {
    posts = await ApiClient().getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              tileColor: Colors.white,
              title: Text(posts[index]['title']),
              subtitle: Text(posts[index]['body']),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
