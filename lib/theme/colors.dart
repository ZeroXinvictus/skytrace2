import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color ink = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF151A26);
  static const Color surfaceRaised = Color(0xFF1B2231);
  static const Color line = Color(0x14FFFFFF);
  static const Color lineStrong = Color(0x29FFFFFF);

  static const Color primaryBlue = Color(0xFF60A5FA);
  static const Color accentBlue = Color(0xFF7CB4FF);
  static const Color deepBlue = Color(0xFFC4B5FD);
  static const Color softSky = Color(0xFF1B2231);
  static const Color cloudWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFFE8EAF0);
  static const Color textMuted = Color(0xFF8F98AA);
  static const Color textSecondary = Color(0xFF8F98AA);
  static const Color successGreen = Color(0xFF4ADE80);
  static const Color warningAmber = Color(0xFFFACC15);
  static const Color errorRed = Color(0xFFF87171);

  static const Color buttonPrimary = Color(0xFF22272E);
  static const Color buttonPrimaryHover = Color(0xFF2D333B);
  static const Color buttonSecondary = Color(0xFF000000);
}

class AppSpacing {
  const AppSpacing._();

  static const double page = 16;
  static const double cardGap = 12;
  static const double tight = 8;
  static const double inner = 12;
  static const double navHeight = 64;
  static const double logoAppBar = 28;
}

class AppRadius {
  const AppRadius._();

  static const double card = 20;
  static const double control = 14;
  static const double dialog = 24;
  static const double pill = 999;
}

class AppMotion {
  const AppMotion._();

  static const Duration fast = Duration(milliseconds: 250);
  static const Duration base = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 500);
  static const Curve curve = Cubic(0.22, 1, 0.36, 1);
  static const Duration stagger = Duration(milliseconds: 45);
}

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.shadow,
    required this.brand,
    required this.brandStrong,
  });

  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color shadow;
  final Color brand;
  final Color brandStrong;

  static const AppPalette dark = AppPalette(
    background: AppColors.ink,
    surface: AppColors.surface,
    surfaceAlt: AppColors.surfaceRaised,
    border: AppColors.line,
    textPrimary: AppColors.textDark,
    textSecondary: AppColors.textSecondary,
    shadow: Color(0xFF000000),
    brand: AppColors.primaryBlue,
    brandStrong: AppColors.accentBlue,
  );

  static const AppPalette light = dark;

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? shadow,
    Color? brand,
    Color? brandStrong,
  }) {
    return AppPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      shadow: shadow ?? this.shadow,
      brand: brand ?? this.brand,
      brandStrong: brandStrong ?? this.brandStrong,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandStrong: Color.lerp(brandStrong, other.brandStrong, t)!,
    );
  }
}

extension PaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>() ?? AppPalette.dark;
}
