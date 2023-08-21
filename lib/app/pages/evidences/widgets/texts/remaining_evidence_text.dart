import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RemainingEvidenceText extends StatelessWidget {
  const RemainingEvidenceText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.lightGrey,
        fontSize: 18,
        fontFamily: "Lazy Dog",
      ),
    );
  }
}
