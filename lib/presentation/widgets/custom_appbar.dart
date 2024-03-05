// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lesson1/infrastructure/utils/styles.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  final String text;
  final List<Widget> icons;
  final String? ava;
  const CustomAppbar({
    Key? key,
    required this.text,
    required this.icons,
    this.ava,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (ava != null) ...[
              CircleAvatar(
                backgroundImage: AssetImage(ava!),
              ),
              const SizedBox(width: 16),
            ],
            Text(
              text,
              style: TextStyles.textTitle(),
            ),
          ],
        ),  
        Row(
          mainAxisSize: MainAxisSize.min,
          children: icons,
        ),
      ],
    );
  }
}
