import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/buttons/back_button_app.dart';
import '../../core/theme/widgets/texts/page_title.dart';
import 'maps_controller.dart';

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
            child: const Column(
              children: [
                PageTitle(
                  title: "Mapas",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
