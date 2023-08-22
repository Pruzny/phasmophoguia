import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../maps_controller.dart';

class MapDropdown extends StatelessWidget {
  const MapDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      init: Get.find<MapsController>(),
      builder: (controller) => Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.grey,
          ),
          child: Theme(
            data: ThemeData(
              canvasColor: AppColors.grey,
            ),
            child: DropdownButton(
              onChanged: (value) {
                controller.selectMap(value!);
              },
              value: controller.selectedMap,
              isExpanded: true,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                fontFamily: "Lazy Dog",
              ),
              iconSize: 32,
              iconEnabledColor: AppColors.white,
              underline: Container(),
              items: controller.maps
                  .map(
                    (map) => DropdownMenuItem(
                      value: map,
                      child: Center(
                        child: Text(
                          map.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
