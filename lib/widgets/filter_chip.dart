import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/icons.dart';
import '../theme/text_styles.dart';

class SkyFilterChip extends StatelessWidget {
  const SkyFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.onClear,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final AppGlyph? icon;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final tone = selected ? AppColors.primaryBlue : AppColors.textSecondary;
    final fill = selected
        ? Color.alphaBlend(const Color(0xFF3B82F6).withValues(alpha: 0.1), AppColors.surface)
        : AppColors.buttonSecondary;
    final border = selected
        ? Color.alphaBlend(const Color(0xFF3B82F6).withValues(alpha: 0.2), AppColors.surface)
        : const Color(0xFF1A1A1A);
    final glyph = icon;
    return AnimatedContainer(
      duration: AppMotion.fast,
      curve: AppMotion.curve,
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: border, width: 1),
        boxShadow: AppComponents.soft3d,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (glyph != null) ...[
                  Ico(glyph, size: 14, color: tone),
                  const SizedBox(width: 6),
                ],
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 140),
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.bodyMedium(p).copyWith(fontSize: 12.5, color: tone),
                  ),
                ),
                if (selected && onClear != null) ...[
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: onClear,
                    child: Ico(AppIcons.xmark, size: 13, color: tone),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
