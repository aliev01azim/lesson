import 'package:flutter/material.dart';

import '../../infrastructure/utils/consts.dart';
import '../../infrastructure/utils/styles.dart';

class MiniTitle extends StatelessWidget {
  const MiniTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Images.i1,width: 48,height: 48),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              'NEW RELEASE FROM',
              style: TextStyles.textGrey(),
            ),
            Text(
              'Sơn Tùng M-TP',
              style: TextStyles.main(),
            ),
          ],
        )
      ],
    );
  }
}
