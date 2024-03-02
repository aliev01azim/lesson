import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class MenuItem extends StatelessWidget {
  final String text;
  const MenuItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: AppColors.greyDark),
      child: Text(
        text,
        style: TextStyles.textGrey(),
      ),
    );
  }
}
