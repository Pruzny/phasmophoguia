import 'package:flutter/material.dart';

import '../../app_colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'October Crow',
          fontSize: 48,
          color: AppColors.white,
        ),
      ),
    );
  }
}
