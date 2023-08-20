import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/texts/page_title.dart';
import 'evidences_controller.dart';
import 'widgets/texts/evidence_label.dart';

class EvidencesPage extends StatelessWidget {
  EvidencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvidencesController>(
      init: Get.find<EvidencesController>(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.darkGrey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PageTitle(
                  title: "Evidencias",
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Center(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          EvidenceLabel(
                            label: "Evidence 1",
                          ),
                          EvidenceLabel(
                            label: "Evidence 2",
                          ),
                          EvidenceLabel(
                            label: "Evidence 3",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 144,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
