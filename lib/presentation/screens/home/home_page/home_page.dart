import 'package:flutter/material.dart';
import 'package:lesson1/presentation/screens/home/home_page/artist_card.dart';
import 'package:lesson1/presentation/widgets/custom_appbar.dart';
import 'package:lesson1/presentation/widgets/menu_item.dart';

import '../../../../infrastructure/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> artists = [
    {'image': Images.i01, 'name': 'MAKING MY WAY'},
    {'image': Images.i01, 'name': 'Sơn Tùng M-TP'},
    {'image': Images.i01, 'name': 'Ed Sheeran'},
    {'image': Images.i01, 'name': 'This Is Sơn Tùng M-TP'},
    {
      'image': Images.i01,
      'name': 'UI Breakfast: UI/UX Design and Product Strategy'
    },
    {'image': Images.i01, 'name': 'Charlie Puth'},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomAppbar(
            text: 'Good morning',
            icons: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.lock_reset_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              MenuItem(text: 'Music'),
              SizedBox(width: 8),
              MenuItem(text: 'Podcasts & Shows'),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1/0.3),
              itemBuilder: (contex, index) => ArtistCard(
                name: artists[index]['name'],
                path: artists[index]['image'],
              ),
              itemCount: artists.length,
            ),
          )
        ],
      ),
    );
  }
}
