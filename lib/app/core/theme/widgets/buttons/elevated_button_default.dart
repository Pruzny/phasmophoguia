import 'package:flutter/material.dart';
import 'package:phasmophoguia/app/core/theme/app_colors.dart';

class ElevatedButtonDefault extends StatelessWidget {
  const ElevatedButtonDefault({
    Key? key,
    this.onPressed,
    this.onLongPress,
    required this.label,
    this.isDisabled = false,
    this.backgroundColor,
    this.labelColor,
  }) : super(key: key);

  final void Function()? onPressed;

  final void Function()? onLongPress;

  final String label;

  final bool isDisabled;

  final Color? backgroundColor;

  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      onLongPress: isDisabled ? null : onLongPress,
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(const Size(double.maxFinite, 48)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          isDisabled ? AppColors.grey : backgroundColor ?? AppColors.white,
        ),
        overlayColor: MaterialStateProperty.all(AppColors.lightGrey),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: AppColors.black, fontSize: 32, fontFamily: "Lazy Dog"),
      ),
    );
  }
}
