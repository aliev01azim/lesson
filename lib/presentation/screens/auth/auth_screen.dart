import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

import '../../../infrastructure/utils/consts.dart';
import 'widgets/auth_button.dart';
import 'widgets/sign_up_button.dart';
import 'widgets/text_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Images.logo),
            Text(
              'Millions of songs.\nFree on Spotify.',
              style: TextStyles.textBig(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 74),
            const SignUpBtn(),
            const SizedBox(height: 8),
            AuthBtn(
              onTap: () {
                print('google button tapped');
              },
              path: Images.googleSvg,
              text: 'Continue with Google',
            ),
            const SizedBox(height: 11),
            AuthBtn(
              onTap: () {
                print('facebook button tapped');
              },
              path: Images.f,
              text: 'Continue with Facebook',
            ),
            const SizedBox(height: 11),
             ButtonText(onTap: (){},),
          ],
        ),
      ),
    );
  }
}
