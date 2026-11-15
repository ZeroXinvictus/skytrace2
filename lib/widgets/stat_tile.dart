import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/icons.dart';
import '../theme/text_styles.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.color = AppColors.primaryBlue,
  });

  final AppGlyph icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.inner + 2),
      decoration: AppComponents.card(p),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
            ),
            alignment: Alignment.center,
            child: Ico(icon, size: 17, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.mono(p, size: 16).copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.label(p)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
