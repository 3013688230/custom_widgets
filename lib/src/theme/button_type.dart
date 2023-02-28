import 'package:flutter/material.dart';

import '../widgets/atoms/custom_text.dart';
import 'app_colors.dart';
import 'spacing.dart';

enum ButtonType { fingerPrint, login, standard, stepper, bold }

extension Evaluate on ButtonType {
  BorderRadiusGeometry borderRadius() {
    switch (this) {
      case ButtonType.login:
      case ButtonType.bold:
      case ButtonType.standard:
        return const BorderRadius.all(Radius.circular(50.0));
      case ButtonType.stepper:
        return const BorderRadius.all(Radius.circular(10.0));
      default:
        return const BorderRadius.all(Radius.circular(50.0));
    }
  }

  Widget? child(String text, bool isEnabled) {
    switch (this) {
      case ButtonType.bold:
        return CustomText(
          text,
          color: isEnabled ? AppColors.customWhite : AppColors.customGray,
          fontWeight: isEnabled ? FontWeight.bold : null,
        );
      case ButtonType.login:
        return CustomText(
          text,
          color: AppColors.customDarkGray,
          fontWeight: isEnabled ? FontWeight.bold : null,
        );
      case ButtonType.stepper:
      case ButtonType.standard:
      default:
        return CustomText(
          text,
          color: isEnabled ? AppColors.customWhite : AppColors.customGray,
        );
    }
  }

  EdgeInsets? padding() {
    switch (this) {
      case ButtonType.bold:
      case ButtonType.login:
      case ButtonType.standard:
        return const EdgeInsets.symmetric(
          horizontal: Spacing.medium,
          vertical: Spacing.medium,
        );
      case ButtonType.stepper:
        return const EdgeInsets.symmetric(
          horizontal: Spacing.medium,
          vertical: Spacing.medium - 2.0,
        );
      default:
        return const EdgeInsets.symmetric(
          horizontal: Spacing.medium + 4.0,
          vertical: Spacing.medium + 4.0,
        );
    }
  }

  ButtonStyle? style(bool isEnabled) {
    switch (this) {
      case ButtonType.login:
        return ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: padding(),
          primary: isEnabled
              ? AppColors.customWhite
              : AppColors.customWhite.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius(),
          ),
        );
      case ButtonType.stepper:
        return ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: padding(),
          primary:
              isEnabled ? AppColors.customGreen : AppColors.customWhiteBone,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius(),
          ),
        );
      case ButtonType.bold:
      case ButtonType.standard:
      default:
        return ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: padding(),
          primary:
              isEnabled ? AppColors.customGreen : AppColors.customWhiteBone,
          shape: isEnabled
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                )
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  side: BorderSide(
                    color: AppColors.customGray,
                    width: 2.0,
                  ),
                ),
        );
    }
  }
}
