import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassyContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final double opacity;
  final double? height;
  final double? width;
  final double? borderWidth;

  const LiquidGlassyContainer({
    super.key,
    required this.child,
    this.blur = 15,
    this.borderRadius = 20,
    this.opacity = 0.15,
    this.height,
    this.width,
    this.borderWidth
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: borderWidth??1
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
