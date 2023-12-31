import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/widgets/buttons/elevated_button_default.dart';
import '../../core/theme/widgets/texts/page_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.darkGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageTitle(
              title: "Phasmophoguia",
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Center(
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      ElevatedButtonDefault(
                        label: "Evidencias",
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.evidences,
                          );
                        },
                      ),
                      ElevatedButtonDefault(
                        label: "Fantasmas",
                        onPressed: () {
                          // Go to ghosts page
                        },
                        isDisabled: true,
                      ),
                      ElevatedButtonDefault(
                        label: "Ossos",
                        onPressed: () {
                          // Go to bones page
                        },
                        isDisabled: true,
                      ),
                      ElevatedButtonDefault(
                        label: "Mapas",
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.maps,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 144,
            )
          ],
        ),
      ),
    );
  }
}
