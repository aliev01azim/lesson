import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';
import 'package:lesson1/presentation/screens/auth/widgets/sarch_field.dart';
import 'package:lesson1/presentation/widgets/custom_appbar.dart';

class SearchPage extends StatelessWidget {
  List<Map<String, dynamic>> artists = [];
  final searchController = TextEditingController();
  final ValueChanged<String>? searchOnChanged;
  SearchPage({super.key, this.searchOnChanged});

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
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          CSearchField(
              controller: searchController,
              onChanged: searchOnChanged,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.greyDark,
              ),
              hintText: 'What do you want to lissten to?',
              hintStyle: TextStyles.searchHint()),
          const SizedBox(height: 14),
          Text(
            'Browse all',
            style: TextStyles.searchHint(color: Colors.white),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 156),
              itemBuilder: (BuildContext contex, int) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.red),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
