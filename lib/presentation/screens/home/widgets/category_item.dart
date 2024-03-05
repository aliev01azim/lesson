import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../infrastructure/utils/consts.dart';
import '../../../../infrastructure/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.item,
  });
  final Map<String, dynamic> item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255), 1),
      ),
      child: Stack(
        children: [
          Text(
            item['category'],
            style: TextStyles.main(),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(26 / 360),
              child: Container(
                decoration: BoxDecoration(boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.35),offset: const Offset(0, 4),blurRadius: 4)]),
                  height: 64, width: 64, child: Image.asset(item['image'],fit: BoxFit.cover,)),
            ),
          )
        ],
      ),
    );
  }
}
