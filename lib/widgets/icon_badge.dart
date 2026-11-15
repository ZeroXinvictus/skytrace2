import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/icons.dart';

class IconBadge extends StatelessWidget {
  const IconBadge({super.key, required this.icon, this.size = 64, this.color = AppColors.primaryBlue});

  final AppGlyph icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: p.surface,
        border: Border.all(color: AppColors.lineStrong, width: 1),
        boxShadow: AppComponents.soft3d,
      ),
      alignment: Alignment.center,
      child: Ico(icon, size: size * 0.4, color: color),
    );
  }
}
