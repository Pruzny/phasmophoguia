import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phasmophoguia/app/pages/evidences/widgets/texts/remaining_evidence_text.dart';

import '../../../core/theme/app_colors.dart';
import '../evidences_controller.dart';

class GhostsPanel extends StatelessWidget {
  GhostsPanel({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvidencesController>(
      init: Get.find<EvidencesController>(),
      builder: (controller) => Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.right,
                color: AppColors.lightGrey,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const VerticalDivider(
                    color: AppColors.lightGrey,
                  ),
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: controller.ghosts.length,
                  itemBuilder: (context, index) {
                    final ghost = controller.ghosts[index];
                    final remainingEvidences = controller.getRemainingEvidences(ghost);

                    return IntrinsicWidth(
                      child: ListTile(
                          onTap: () {
                            // TODO: Implementar ação de clique no fantasma para abrir a página correspondente
                          },
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          title: Text(
                            ghost.name.toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Lazy Dog",
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              remainingEvidences.length,
                              (index) => RemainingEvidenceText(
                                text: "${remainingEvidences[index]}",
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
