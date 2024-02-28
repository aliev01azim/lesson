import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/routes.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

import '../../../widgets/text_field.dart';
import '../../../widgets/wrap_item.dart';
import '../widgets/app_bar.dart';
import '../widgets/artist_item.dart';
import '../widgets/mini_button.dart';
import '../widgets/sarch_field.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  final controller = TextEditingController();
  final artists = [
    {'image': Images.i1, 'name': 'Sơn Tùng M-TP'},
    {'image': Images.i2, 'name': 'Ed Sheeran'},
    {'image': Images.i3, 'name': 'Charlie Puth'},
    {'image': Images.i1, 'name': 'MONO'},
    {'image': Images.i2, 'name': 'The Weeknd'},
    {'image': Images.i3, 'name': 'Taylor Swift'},
    {'image': Images.i1, 'name': 'Billie Eilish'},
    {'image': Images.i2, 'name': 'Grey D'},
    {'image': Images.i3, 'name': 'Bích Phương'},
    {'image': Images.i1, 'name': 'DA LAB'},
    {'image': Images.i2, 'name': 'Vũ.'},
    {'image': Images.i3, 'name': 'Alan Walker'},
  ];
  List selectedArtists = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Choose 3 or more artists \nyou like',
                style: TextStyles.textTitle(),
              ),
              const SizedBox(height: 16),
              CSearchField(
                cursorColor: Colors.black,
                style: TextStyles.searchHint(),
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                hintStyle: TextStyles.searchHint(),
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 22),
                  itemBuilder: (context, index) => ArtistItem(
                    name: artists[index]['name']!,
                    path: artists[index]['image']!,
                    onTap: () {
                      setState(() {
                        if (selectedArtists.contains(artists[index])) {
                          selectedArtists.remove(artists[index]);
                        } else {
                          selectedArtists.add(artists[index]);
                        }
                      });
                    },
                    selected: selectedArtists.contains(artists[index]),
                  ),
                  itemCount: artists.length,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: MiniBtn(
                  onTap: () {},
                  text: 'Next',
                  enable: selectedArtists.length >= 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
