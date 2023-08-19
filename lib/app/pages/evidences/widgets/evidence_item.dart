import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EvidenceItem extends StatelessWidget {
  const EvidenceItem({
    super.key,
    required this.label,
    required this.icon,
    this.color = AppColors.white,
  });

  final String label;

  final Image icon;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
