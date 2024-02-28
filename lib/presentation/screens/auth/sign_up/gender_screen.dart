import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/routes.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

import '../../../widgets/text_field.dart';
import '../../../widgets/wrap_item.dart';
import '../widgets/app_bar.dart';
import '../widgets/mini_button.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final List<String> genders = [
    'Female',
    'Male',
    'Non-binary',
    'Other',
    'Prefer not to say'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(
        title: 'Create an account',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'What’s your gender?',
              style: TextStyles.textTitle(),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: genders
                  .map((e) => WrapItem(
                        text: e,
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.artists);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
