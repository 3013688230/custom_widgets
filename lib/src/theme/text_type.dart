import 'dart:ui';

enum TextType {
  title,
  subtitle,
  heading,
  hint,
}

extension Evaluate on TextType {
  double fontSize() {
    switch (this) {
      case TextType.title:
        return 26.0;
      case TextType.subtitle:
        return 16.0;
      case TextType.heading:
      case TextType.hint:
        return 12.0;
      default:
        return 26.0;
    }
  }

  FontWeight? fontWeight() {
    switch (this) {
      case TextType.title:
        return FontWeight.bold;
      case TextType.title:
        return FontWeight.normal;
      case TextType.heading:
        return FontWeight.bold;
      case TextType.hint:
        return FontWeight.w200;
      default:
        return FontWeight.bold;
    }
  }
}
