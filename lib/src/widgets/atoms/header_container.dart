import '../../theme/app_colors.dart';
import '../../theme/icon_size.dart';
import '../../theme/text_type.dart';
import 'custom_text.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer(
    this.title, {
    super.key,
    this.isMenuIconVisible = false,
    this.onPressedMenuIcon,
    this.scaffoldState,
  });

  final String title;
  final bool isMenuIconVisible;
  final VoidCallback? onPressedMenuIcon;
  final ScaffoldState? scaffoldState;

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: size.height * 0.1,
        child: Row(
          children: [
            _renderIconButton(context),
            CustomText(
              widget.title,
              color: AppColors.customDarkBeige,
              type: TextType.title,
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderIconButton(BuildContext context) {
    if (widget.isMenuIconVisible) {
      return IconButton(
        onPressed: widget.onPressedMenuIcon,
        icon: const Icon(
          Icons.menu,
          color: AppColors.customDarkBeige,
          size: Iconsize.small - 2.0,
        ),
      );
    } else {
      return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.customDarkBeige,
          size: Iconsize.small - 2.0,
        ),
      );
    }
  }
}
