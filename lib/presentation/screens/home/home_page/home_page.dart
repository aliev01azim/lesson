import 'package:flutter/material.dart';
import 'package:lesson1/presentation/screens/home/home_page/six_artists.dart';
import 'package:lesson1/presentation/widgets/custom_appbar.dart';
import 'package:lesson1/presentation/widgets/menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          const SizedBox(height: 26),
          
          SixArtists(),
          SizedBox(width: 8),
          SixArtists()

          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2),
          //   itemBuilder: (contex, index) => const SixArtists(

          //   ),
          // )
        ],
      ),
    );
  }
}
