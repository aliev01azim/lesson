import 'package:flutter/material.dart';

import '../../../../infrastructure/utils/consts.dart';
import '../../../../infrastructure/utils/styles.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('text button tapped');
      },
      child: Text(
        'Log in',
        style: TextStyles.textButton(),
      ),
    );
  }
}
