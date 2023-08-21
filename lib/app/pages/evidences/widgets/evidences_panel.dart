import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../evidences_controller.dart';
import 'evidence_item.dart';

class EvidencesPanel extends StatelessWidget {
  const EvidencesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvidencesController>(
      init: Get.find<EvidencesController>(),
      builder: (controller) => Obx(
        () => Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: controller.evidences
              .map(
                (evidence) => GestureDetector(
                  onTap: () {
                    controller.changeEvidenceStatus(
                      evidence.id,
                    );
                    controller.update();
                  },
                  child: EvidenceItem(
                    evidence: evidence,
                    status: controller.getEvidenceStatus(evidence.id),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
