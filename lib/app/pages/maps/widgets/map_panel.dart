import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../maps_controller.dart';

class MapPanel extends StatelessWidget {
  const MapPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      init: Get.find<MapsController>(),
      builder: (controller) => Obx(
        () => Container(
          constraints: BoxConstraints(
            minHeight: 0,
            maxHeight: Get.height * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InteractiveViewer(
            maxScale: 8,
            child: SvgPicture.asset(
              "$mapsImagePath${controller.selectedMap.label}.svg",
            ),
          ),
        ),
      ),
    );
  }
}
