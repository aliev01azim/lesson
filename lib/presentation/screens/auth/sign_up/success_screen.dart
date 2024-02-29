import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/presentation/screens/auth/widgets/mini_button.dart';
import 'package:lesson1/presentation/screens/auth/widgets/text_button.dart';

import '../../../../infrastructure/utils/routes.dart';
import '../../../../infrastructure/utils/styles.dart';
import '../widgets/mini_artist_item.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var artists = ModalRoute.of(context)!.settings.arguments
        as List<Map<String, dynamic>>;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.red.withOpacity(0.7),
                AppColors.black,
                AppColors.black,
                AppColors.black,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Stack(
                    alignment: Alignment.center,
                    children: artists.map(
                      (e) {
                        var indexOf = artists.indexOf(e);
                        return MiniArtistItem(
                          path: e['image'],
                          index: indexOf + 1,
                          amount: artists.length,
                        );
                      },
                    ).toList()),
              ),
              const SizedBox(height: 24),
              Text(
                'Great Picks!',
                style: TextStyles.textTitle(),
              ),
              const SizedBox(height: 12),
              Text(
                'We’ve made a playlist to get you started',
                style: TextStyles.textButton(),
              ),
              const SizedBox(height: 48),
              MiniBtn(
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.main,(Route route) => false),
                  text: 'Start Listening',
                  enable: true),
              const SizedBox(height: 8),
              ButtonText(
                color: AppColors.greenLight,
                text: 'Not now',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
