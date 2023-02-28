import 'package:custom_widgets_app/src/theme/app_colors.dart';
import 'package:custom_widgets_app/src/theme/button_type.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.text, {
    super.key,
    this.isEnabled = true,
    required this.onPressed,
    this.type = ButtonType.standard,
  });

  final String text;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.fingerPrint:
        return CircleAvatar(
          backgroundColor: isEnabled
              ? AppColors.customWhite
              : AppColors.customWhite.withOpacity(0.4),
          radius: 25.0,
          child: IconButton(
            onPressed: isEnabled ? onPressed : () => {},
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(
              Icons.print,
              color: AppColors.customDarkGray,
              weight: 40.0,
            ),
          ),
        );
      case ButtonType.login:
      case ButtonType.stepper:
      case ButtonType.standard:
      default:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : () => {},
          style: type.style(isEnabled),
          child: type.child(text, isEnabled),
        );
    }
  }
}
