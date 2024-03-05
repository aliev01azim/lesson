import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';
import 'package:lesson1/presentation/screens/home/widgets/artist_card.dart';
import 'package:lesson1/presentation/widgets/custom_appbar.dart';
import 'package:lesson1/presentation/widgets/menu_item.dart';

import '../../../../infrastructure/utils/consts.dart';
import '../../../widgets/mini_title.dart';
import '../widgets/artist_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> artists = [
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
  final List<String> artistsRectangle = [
    Images.irect,
    Images.irect,
    Images.irect,
    Images.irect,
    Images.irect,
    Images.irect
  ];
  final List<String> menuItems = ['Music', 'Podcasts & Shows'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 30,
              child: ListView.separated(
                itemBuilder: (_, index) => MenuItem(text: menuItems[index]),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: menuItems.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 0.3),
              itemBuilder: (contex, index) => ArtistCard(
                name: artists[index]['name'],
                path: artists[index]['image'],
              ),
              itemCount: artists.length,
            ),
            const SizedBox(height: 24),
            const MiniTitle(),
            const SizedBox(height: 12),
            const ArtistContainer(),
            const SizedBox(height: 24),
            Text('Jump back in', style: TextStyles.textTitle()),
            const SizedBox(height: 17),
            SizedBox(
              height: 135,
              child: ListView.separated(
                itemCount: artistsRectangle.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Image.asset(
                  artistsRectangle[index],
                  fit: BoxFit.cover,
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
