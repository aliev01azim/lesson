import 'package:flutter/material.dart';

import '../../../../infrastructure/utils/consts.dart';
import '../../../../infrastructure/utils/styles.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        decoration: const BoxDecoration(
          color: AppColors.greyDark,
          borderRadius: BorderRadius.all(
            Radius.circular(17),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.i01,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      Text('MAKING MY WAY MAKING',
                          style: TextStyles.searchHint(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text('Single | Son Tung M-TP',
                          style: TextStyles.textGrey(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8,bottom: 14),
                        child: const Icon(Icons.favorite_outline,
                            size: 32, color: AppColors.focusedField),
                      ),
                      const Icon(Icons.play_circle_fill_outlined,
                          size: 32, color: Colors.white),
                    ],
                  ),
                  // const SizedBox(height: 14),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ));
  }
}
