import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key,required this.name,required this.path});
  final String path;
  final String name;

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.greyDark,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
       child:Row(
        children: [
          Image.asset(path,height: 100,fit: BoxFit.contain,),
          const SizedBox(width: 8),
          Expanded(child: Text(name,style: TextStyles.searchHint(color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,)),
        ],
       )
    );
  }
}
