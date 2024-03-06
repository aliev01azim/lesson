import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class SortRow extends StatelessWidget {
  const SortRow({super.key, required this.callBack, required this.isGrid});
  final Function callBack;
  final bool isGrid;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.swap_vert,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              'Recents',
              style: TextStyles.searchHint(color: Colors.white),
            ),
          ],
        ),
        IconButton(
          onPressed: () => callBack(),
          icon: Icon(
            isGrid ? Icons.list : Icons.grid_view_outlined,
            size: 24,
          ),
          color: Colors.white,
        )
      ],
    );
  }
}
