import 'package:flutter/material.dart';
import 'package:phasmophoguia/app/core/theme/app_colors.dart';
import 'package:phasmophoguia/app/core/theme/widgets/buttons/elevated_button_default.dart';
import 'package:phasmophoguia/app/pages/home/widgets/app_name.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.darkGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppName(),
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
                          // Go to evidence page
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
                          // Go to maps page
                        },
                        isDisabled: true,
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
