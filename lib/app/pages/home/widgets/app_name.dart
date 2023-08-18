import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      alignment: Alignment.topCenter,
      child: const Text(
        "Phasmophoguia",
        style: TextStyle(
          fontFamily: 'October Crow',
          fontSize: 48,
          color: AppColors.white,
        ),
      ),
    );
  }
}
