import 'package:flutter/material.dart';

import '../models/traffic.dart';
import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/text_styles.dart';

Color statusColor(TrafficSummary t) {
  if (t.blocked) return AppColors.warningAmber;
  if (t.isFailed) return AppColors.errorRed;
  if (t.tunnel) return AppColors.textSecondary;
  if (t.isPending) return AppColors.textSecondary;
  final c = t.statusCode;
  if (c >= 500) return AppColors.errorRed;
  if (c >= 400) return AppColors.warningAmber;
  if (c >= 300) return AppColors.deepBlue;
  if (c >= 200) return AppColors.successGreen;
  return AppColors.textSecondary;
}

Color statusColorForCode(int code, {bool failed = false}) {
  if (failed) return AppColors.errorRed;
  if (code >= 500) return AppColors.errorRed;
  if (code >= 400) return AppColors.warningAmber;
  if (code >= 300) return AppColors.deepBlue;
  if (code >= 200) return AppColors.successGreen;
  return AppColors.textSecondary;
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  factory StatusBadge.forTraffic(TrafficSummary t) {
    final label = t.blocked
        ? 'BLOCK'
        : t.isFailed
        ? 'ERR'
        : t.tunnel
            ? 'TUN'
            : t.isPending
                ? '...'
                : t.statusCode.toString();
    return StatusBadge(label: label, color: statusColor(t));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: AppComponents.badge(color),
      child: Text(
        label,
        style: AppText.mono(context.palette, size: 10.5).copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
