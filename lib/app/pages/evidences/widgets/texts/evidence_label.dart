import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class EvidenceLabel extends StatelessWidget {
  const EvidenceLabel({
    super.key,
    required this.label,
    this.color = AppColors.white,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: 24,
      ),
    );
  }
}
