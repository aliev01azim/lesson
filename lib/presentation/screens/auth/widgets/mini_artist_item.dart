import 'package:flutter/material.dart';

import '../../../../infrastructure/utils/consts.dart';

class MiniArtistItem extends StatelessWidget {
  const MiniArtistItem({
    super.key,
    required this.path,
    required this.index,
    required this.amount,
  });

  final String path;
  final int index;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left:( index*(35-amount+index)).toDouble(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 2),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
