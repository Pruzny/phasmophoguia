import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/buttons/back_button_app.dart';
import '../../core/theme/widgets/texts/page_title.dart';
import 'evidences_controller.dart';
import 'widgets/buttons/reset_button.dart';
import 'widgets/evidences_panel.dart';
import 'widgets/ghosts_panel.dart';

class EvidencesPage extends StatelessWidget {
  EvidencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EvidencesController>(
      init: Get.find<EvidencesController>(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: const Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BackButtonApp(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ResetButton(),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
            color: AppColors.darkGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageTitle(
                  title: "Evidencias",
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Column(
                              children: [
                                const EvidencesPanel(),
                                Expanded(
                                  child: FractionallySizedBox(
                                    heightFactor: 0.75,
                                    child: GhostsPanel(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
