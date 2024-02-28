import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem(
      {super.key,
      required this.name,
      required this.path,
      required this.onTap,
      this.selected = false});
  final String path;
  final String name;
  final Function onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? AppColors.greyDark : null,
        ),
        child: Column(
          children: [
            Image.asset(
              path,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyles.textButton(),
            ),
          ],
        ),
      ),
    );
  }
}
