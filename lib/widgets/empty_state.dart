import 'package:flutter/material.dart';

import '../theme/animations.dart';
import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/text_styles.dart';
import 'icon_badge.dart';
import 'sky_button.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.action,
  });

  final AppGlyph icon;
  final String title;
  final String body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.page * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconBadge(icon: icon).scaleIn(),
            const SizedBox(height: 20),
            Text(title, style: AppText.heading(p), textAlign: TextAlign.center).fadeInUp(index: 1),
            if (body.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(body, style: AppText.caption(p).copyWith(fontSize: 13), textAlign: TextAlign.center)
                  .fadeInUp(index: 2),
            ],
            if (action != null) ...[
              const SizedBox(height: 20),
              action!.fadeInUp(index: 3),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.message, required this.retryLabel, required this.onRetry});

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.page * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const IconBadge(icon: AppIcons.circleExclamation, color: AppColors.errorRed),
            const SizedBox(height: 16),
            Text(message, style: AppText.body(p), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            SkyButton(
              label: retryLabel,
              variant: BtnVariant.secondary,
              icon: const Ico(AppIcons.arrowsRotate),
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
