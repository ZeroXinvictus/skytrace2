import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/component_styles.dart';
import '../theme/text_styles.dart';

enum BtnVariant { primary, success, danger, secondary, info, warning }

class _BtnStyle {
  const _BtnStyle({required this.fill, required this.border, required this.foreground, required this.pressed});

  final Color fill;
  final Color border;
  final Color foreground;
  final Color pressed;
}

Color _tint(Color base, double alpha) => Color.alphaBlend(base.withValues(alpha: alpha), AppColors.surface);

_BtnStyle _styleFor(BtnVariant variant) {
  switch (variant) {
    case BtnVariant.primary:
      return const _BtnStyle(
        fill: AppColors.buttonPrimary,
        border: Color(0xFF383D45),
        foreground: Colors.white,
        pressed: AppColors.buttonPrimaryHover,
      );
    case BtnVariant.success:
      return _BtnStyle(
        fill: _tint(const Color(0xFF22C55E), 0.1),
        border: _tint(const Color(0xFF22C55E), 0.2),
        foreground: const Color(0xFF4ADE80),
        pressed: _tint(const Color(0xFF22C55E), 0.2),
      );
    case BtnVariant.danger:
      return _BtnStyle(
        fill: _tint(const Color(0xFFEF4444), 0.1),
        border: _tint(const Color(0xFFEF4444), 0.2),
        foreground: const Color(0xFFF87171),
        pressed: _tint(const Color(0xFFEF4444), 0.2),
      );
    case BtnVariant.info:
      return _BtnStyle(
        fill: _tint(const Color(0xFF3B82F6), 0.1),
        border: _tint(const Color(0xFF3B82F6), 0.2),
        foreground: const Color(0xFF60A5FA),
        pressed: _tint(const Color(0xFF3B82F6), 0.2),
      );
    case BtnVariant.warning:
      return _BtnStyle(
        fill: _tint(const Color(0xFFEAB308), 0.1),
        border: _tint(const Color(0xFFEAB308), 0.2),
        foreground: const Color(0xFFFACC15),
        pressed: _tint(const Color(0xFFEAB308), 0.2),
      );
    case BtnVariant.secondary:
      return const _BtnStyle(
        fill: AppColors.buttonSecondary,
        border: Color(0xFF1A1A1A),
        foreground: Color(0xFF9CA3AF),
        pressed: Color(0xFF111111),
      );
  }
}

class SkyButton extends StatelessWidget {
  const SkyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.secondary = false,
    this.loading = false,
    this.danger = false,
    this.expand = false,
    this.variant,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool secondary;
  final bool loading;
  final bool danger;
  final bool expand;
  final BtnVariant? variant;

  BtnVariant get _variant {
    final explicit = variant;
    if (explicit != null) return explicit;
    if (danger) return BtnVariant.danger;
    if (secondary) return BtnVariant.secondary;
    return BtnVariant.primary;
  }

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    final style = _styleFor(_variant);
    final radius = BorderRadius.circular(AppRadius.pill);

    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading)
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: style.foreground),
          )
        else if (icon != null)
          IconTheme(data: IconThemeData(color: style.foreground, size: 16), child: icon!),
        if (loading || icon != null) const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.button().copyWith(color: style.foreground),
          ),
        ),
      ],
    );

    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: Container(
        decoration: BoxDecoration(
          color: style.fill,
          borderRadius: radius,
          border: Border.all(color: style.border, width: 1),
          boxShadow: enabled ? AppComponents.soft3d : null,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: enabled ? onPressed : null,
                  highlightColor: style.pressed,
                  splashColor: style.pressed,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 46, minWidth: 64),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: content,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 1,
                child: IgnorePointer(child: ColoredBox(color: Color(0x1AFFFFFF))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
