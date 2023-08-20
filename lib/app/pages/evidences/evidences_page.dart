import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/texts/page_title.dart';
import 'evidences_controller.dart';
import 'widgets/evidence_item.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageTitle(
                  title: "Evidencias",
                ),
                Expanded(
                  child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Obx(
                        () => controller.isLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Wrap(
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
                                        },
                                        child: EvidenceItem(
                                          evidence: evidence,
                                          status: controller.getEvidenceStatus(evidence.id),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                      )),
                ),
                const SizedBox(
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
