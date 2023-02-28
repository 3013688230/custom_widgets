import '../../theme/app_colors.dart';
import 'package:flutter/material.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({
    super.key,
    this.child,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.all(20.0),
    this.transform,
    this.width,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      transform: widget.transform,
      color: AppColors.customWhiteBone,
      height: widget.height,
      width: widget.width,
      child: widget.child,
    );
  }
}
