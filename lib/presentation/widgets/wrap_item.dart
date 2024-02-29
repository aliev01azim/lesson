import 'package:flutter/material.dart';

import '../../infrastructure/utils/consts.dart';
import '../../infrastructure/utils/styles.dart';

class WrapItem extends StatelessWidget {
  const WrapItem({super.key, required this.onTap, required this.text});
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.greyDark)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          text,
          style: TextStyles.textButton(),
        ),
      ),
    );
  }
}
