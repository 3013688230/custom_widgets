import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_type.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.color = AppColors.customLightBlack,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.type = TextType.subtitle,
  });

  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextType type;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? type.fontSize(),
        fontWeight: fontWeight ?? type.fontWeight(),
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
