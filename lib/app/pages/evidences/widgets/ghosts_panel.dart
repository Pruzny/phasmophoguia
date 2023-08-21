import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../evidences_controller.dart';
import 'texts/remaining_evidence_text.dart';

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
            color: controller.foundGhost ? AppColors.green : AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: controller.foundGhost
              ? Center(
                  child: Text(
                    controller.ghosts.first.name.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      fontFamily: "Lazy Dog",
                    ),
                  ),
                )
              : Padding(
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
                          final isDiscarded = controller.discardedGhosts.contains(ghost.id);

                          return IntrinsicWidth(
                            child: ListTile(
                                onTap: () {
                                  controller.handleGhostTap(ghost);
                                  controller.update();
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                title: Text(
                                  ghost.name.toUpperCase(),
                                  style: TextStyle(
                                    color: isDiscarded ? AppColors.lightGrey : AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: "Lazy Dog",
                                    decoration: isDiscarded ? TextDecoration.lineThrough : null,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: List.generate(
                                      remainingEvidences.length,
                                      (index) => RemainingEvidenceText(
                                        text: controller.getEvidenceName(remainingEvidences[index]),
                                      ),
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
