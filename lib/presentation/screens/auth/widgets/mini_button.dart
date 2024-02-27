import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class MiniBtn extends StatelessWidget {
  const MiniBtn(
      {super.key, required this.onTap, required this.text, this.enable = true});
  final Function onTap;
  final String text;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            enable ? Colors.white : AppColors.greyDark),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        ),
      ),
      onPressed: enable ? () => onTap() : null,
      child: Text(
        text,
        style: TextStyles.textButton(
          color: AppColors.black,
        ),
      ),
    );
  }
}
