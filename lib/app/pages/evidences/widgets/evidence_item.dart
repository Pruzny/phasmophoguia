import 'package:flutter/material.dart';
import 'package:phasmophoguia/app/core/constants.dart';

import '../../../core/domain/entities/evidence_entity.dart';
import '../../../core/theme/app_colors.dart';

class EvidenceItem extends StatelessWidget {
  const EvidenceItem({
    super.key,
    required this.evidence,
    this.color = AppColors.white,
    this.inactiveColor = AppColors.lightGrey,
    this.isActive = true,
  });

  final EvidenceEntity evidence;

  final Color color;

  final Color inactiveColor;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        children: [
          Text(
            evidence.name,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "$evidencesImagePath${evidence.label}.png",
            height: 60,
          ),
        ],
      ),
    );
  }
}
