import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/buttons/back_button_app.dart';
import '../../core/theme/widgets/texts/page_title.dart';
import 'maps_controller.dart';
import 'widgets/map_dropdown.dart';
import 'widgets/map_panel.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      init: Get.find<MapsController>(),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: const BackButtonApp(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
            color: AppColors.darkGrey,
            child: Column(
              children: [
                const PageTitle(
                  title: "Mapas",
                ),
                Obx(
                  () => controller.isLoading || controller.maps.isEmpty
                      ? const CircularProgressIndicator()
                      : const FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MapDropdown(),
                              SizedBox(
                                height: 16,
                              ),
                              MapPanel(),
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
