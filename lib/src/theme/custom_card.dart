import 'app_colors.dart';
import 'app_themes.dart';
import 'icon_size.dart';
import 'spacing.dart';
import 'text_type.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.active,
    required this.height,
    //required this.icon,
    required this.iconData,
    required this.isValid,
    required this.onPressed,
    required this.subTitle,
    required this.title,
    required this.titleButton,
    required this.width,
  });

  final bool active;
  final double height;
  //final String? icon;
  final IconData? iconData;
  final bool isValid;
  final VoidCallback onPressed;
  final String subTitle;
  final String title;
  final String titleButton;
  final double width;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final appThemes = AppThemes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: widget.active
          ? const BoxDecoration(
              color: AppColors.customWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: AppColors.customGray,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                ),
              ],
            )
          : null,
      height: widget.height,
      width: widget.width,
      margin: const EdgeInsets.only(
        bottom: Spacing.small + 2.0,
        left: Spacing.xSmall + 1.0,
        right: Spacing.xSmall + 1.0,
        top: Spacing.small + 2.0,
      ),
      padding: const EdgeInsets.all(
        Spacing.small + 2.0,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: Spacing.xSmall + 3.0,
              top: Spacing.xSmall + 2.0,
            ),
            width: size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  widget.title,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                CustomText(
                  widget.subTitle,
                  type: TextType.hint,
                ),
              ],
            ),
          ),
          widget.active
              ? ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: 50.0,
                    width: size.width * 0.29,
                  ),
                  child: CustomButton(
                    widget.titleButton,
                    onPressed: widget.onPressed,
                  ),
                )
              : widget.isValid
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: Spacing.xLarge * 2.0,
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.customGreen,
                        size: Iconsize.small + 2.0,
                      ),
                    )
                  : const SizedBox.shrink()
        ],
      ),
    );
  }
}
