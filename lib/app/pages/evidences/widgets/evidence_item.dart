import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/domain/entities/evidence_entity.dart';
import '../../../core/enums/evidence_status.dart';
import '../../../core/theme/app_colors.dart';

const colorMap = <EvidenceStatus, Color>{
  EvidenceStatus.notSelected: AppColors.white,
  EvidenceStatus.selected: AppColors.green,
  EvidenceStatus.discarded: AppColors.lightGrey,
  EvidenceStatus.impossible: AppColors.grey,
};

class EvidenceItem extends StatelessWidget {
  EvidenceItem({
    super.key,
    required this.evidence,
    required this.status,
  }) : color = colorMap[status]!;

  final EvidenceEntity evidence;

  final EvidenceStatus status;

  final Color color;

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
              fontSize: 20,
              fontFamily: "Lazy Dog",
            ),
            textAlign: TextAlign.center,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
            child: Image.asset(
              "$evidencesImagePath${evidence.label}.png",
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
