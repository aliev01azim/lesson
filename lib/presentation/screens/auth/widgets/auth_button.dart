import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';

import '../../../../infrastructure/utils/styles.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn(
      {super.key, required this.onTap, required this.path, required this.text});
  final String text;
  final String path;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: AppColors.greyDark),
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            const Size(double.maxFinite, 45),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(path),
            Text(text, style: TextStyles.textButton(),),
            SvgPicture.asset(path,color: Colors.transparent,),
          ],
        ));
  }
}
