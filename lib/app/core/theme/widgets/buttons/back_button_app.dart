import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phasmophoguia/app/core/theme/app_colors.dart';

class BackButtonApp extends StatelessWidget {
  const BackButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: AppColors.white,
        elevation: 0,
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.darkGrey,
          size: 32,
        ),
      ),
    );
  }
}
