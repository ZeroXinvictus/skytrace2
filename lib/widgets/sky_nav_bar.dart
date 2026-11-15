import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/icons.dart';
import '../theme/text_styles.dart';

class SkyNavItem {
  const SkyNavItem({required this.icon, required this.label, this.badge = 0});

  final AppGlyph icon;
  final String label;
  final int badge;
}

class SkyNavBar extends StatelessWidget {
  const SkyNavBar({
    super.key,
    required this.items,
    required this.index,
    required this.onChanged,
    required this.running,
    required this.busy,
    required this.onPower,
    required this.powerLabel,
  });

  final List<SkyNavItem> items;
  final int index;
  final ValueChanged<int> onChanged;
  final bool running;
  final bool busy;
  final VoidCallback onPower;
  final String powerLabel;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final left = items.sublist(0, 2);
    final right = items.sublist(2, 4);
    return Container(
      decoration: BoxDecoration(
        color: p.background,
        border: Border(top: BorderSide(color: p.border, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSpacing.navHeight,
          child: Row(
            children: [
              for (var i = 0; i < left.length; i++)
                Expanded(child: _NavButton(item: left[i], active: index == i, onTap: () => onChanged(i))),
              SizedBox(
                width: 84,
                child: Center(child: _PowerButton(running: running, busy: busy, onTap: onPower, label: powerLabel)),
              ),
              for (var i = 0; i < right.length; i++)
                Expanded(
                  child: _NavButton(item: right[i], active: index == i + 2, onTap: () => onChanged(i + 2)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.active, required this.onTap});

  final SkyNavItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final color = active ? AppColors.primaryBlue : p.textSecondary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.control),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: AppMotion.base,
                curve: AppMotion.curve,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  color: active ? AppColors.primaryBlue.withValues(alpha: 0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  border: Border.all(
                    color: active ? AppColors.primaryBlue.withValues(alpha: 0.2) : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Ico(item.icon, size: 20, color: color),
              ),
              if (item.badge > 0)
                Positioned(
                  right: -2,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(AppColors.errorRed.withValues(alpha: 0.2), AppColors.surface),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      border: Border.all(color: AppColors.errorRed.withValues(alpha: 0.4), width: 1),
                    ),
                    child: Text(
                      '${item.badge}',
                      style: AppText.mono(p, size: 9).copyWith(color: AppColors.errorRed, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          AnimatedDefaultTextStyle(
            duration: AppMotion.fast,
            style: AppText.label(p).copyWith(
              fontSize: 10.5,
              color: color,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            ),
            child: Text(item.label, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class _PowerButton extends StatelessWidget {
  const _PowerButton({required this.running, required this.busy, required this.onTap, required this.label});

  final bool running;
  final bool busy;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final tone = running ? AppColors.errorRed : AppColors.successGreen;
    final base = running ? const Color(0xFFEF4444) : const Color(0xFF22C55E);
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: busy ? null : onTap,
        child: AnimatedContainer(
          duration: AppMotion.base,
          curve: AppMotion.curve,
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.alphaBlend(base.withValues(alpha: 0.1), AppColors.surface),
            border: Border.all(color: Color.alphaBlend(base.withValues(alpha: 0.25), AppColors.surface), width: 1),
            boxShadow: AppComponents.soft3d,
          ),
          alignment: Alignment.center,
          child: busy
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2.2, color: tone),
                )
              : Ico(AppIcons.powerOff, size: 22, color: tone),
        ),
      ),
    );
  }
}
