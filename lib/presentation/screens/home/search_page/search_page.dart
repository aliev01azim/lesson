import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';
import 'package:lesson1/presentation/screens/auth/widgets/sarch_field.dart';
import 'package:lesson1/presentation/widgets/custom_appbar.dart';

import '../widgets/category_item.dart';

class SearchPage extends StatefulWidget {
  final ValueChanged<String>? searchOnChanged;
  const SearchPage({super.key, this.searchOnChanged});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> categories = [
    {'category': 'Podcasts', 'image': Images.i01},
    {'category': 'Live Events', 'image': Images.i01},
    {'category': 'Made For You', 'image': Images.i01},
    {'category': 'New releases', 'image': Images.i01},
    {'category': 'Vietnamese Music', 'image': Images.i01},
    {'category': 'Pop', 'image': Images.i01},
    {'category': 'K-pop', 'image': Images.i01},
    {'category': 'Hip-Hop', 'image': Images.i01},
    {'category': 'Charts', 'image': Images.i01},
    {'category': 'Fresh Finds', 'image': Images.i01},
    {'category': 'Podcasts', 'image': Images.i01},
    {'category': 'Live Events', 'image': Images.i01},
    {'category': 'Made For You', 'image': Images.i01},
    {'category': 'New releases', 'image': Images.i01},
    {'category': 'Vietnamese Music', 'image': Images.i01},
  ];

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            text: 'Search',
            icons: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.focusedField,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          CSearchField(
              controller: searchController,
              onChanged: widget.searchOnChanged,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.focusedField,
              ),
              style: TextStyles.searchHint(color: AppColors.black),
              hintText: 'What do you want to lissten to?',
              hintStyle: TextStyles.searchHint()),
          const SizedBox(height: 13),
          Text(
            'Browse all',
            style: TextStyles.searchHint(color: Colors.white),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 21/10),
              itemBuilder: (BuildContext contex, int index) {
                return CategoryItem(item: categories[index]);
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}

