import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';

class SixArtists extends StatelessWidget {
  const SixArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 50),
      decoration: const BoxDecoration(
        color: AppColors.greyDark,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        image: DecorationImage(
          image: AssetImage(Images.i02),
        ),
      ),
    );
  }
}
