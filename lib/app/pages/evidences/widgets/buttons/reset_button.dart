import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../evidences_controller.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvidencesController>(
      init: Get.find<EvidencesController>(),
      builder: (controller) {
        return Obx(
          () => controller.hasContent
              ? Container(
                  padding: const EdgeInsets.only(top: 16, right: 32),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.reset();
                      controller.fetch();
                    },
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    child: const Icon(
                      Icons.restart_alt,
                      color: AppColors.darkGrey,
                      size: 32,
                    ),
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
