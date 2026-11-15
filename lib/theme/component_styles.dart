import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppComponents {
  const AppComponents._();

  static const List<BoxShadow> soft3d = [
    BoxShadow(color: Color(0x66000000), blurRadius: 14, offset: Offset(0, 4)),
  ];

  static List<BoxShadow> cardShadow(AppPalette p) => [
        BoxShadow(
          color: p.shadow.withValues(alpha: 0.3),
          blurRadius: 24,
          spreadRadius: 0,
          offset: const Offset(0, 8),
        ),
      ];

  static BoxDecoration card(AppPalette p) => BoxDecoration(
        color: p.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: cardShadow(p),
        border: Border.all(color: p.border, width: 1),
      );

  static BoxDecoration badge(Color color) => BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      );

  static InputDecoration input(AppPalette p, {String? hint, Widget? prefix, Widget? suffix}) {
    OutlineInputBorder border(Color color, double width) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: color, width: width),
        );
    return InputDecoration(
      hintText: hint,
      hintStyle: AppText.body(p).copyWith(color: p.textSecondary),
      prefixIcon: prefix,
      suffixIcon: suffix,
      filled: true,
      fillColor: p.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: border(AppColors.lineStrong, 1),
      border: border(AppColors.lineStrong, 1),
      focusedBorder: border(AppColors.primaryBlue.withValues(alpha: 0.6), 1.2),
    );
  }

  static ThemeData theme(AppPalette p, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.primaryBlue,
      onPrimary: AppColors.ink,
      secondary: AppColors.accentBlue,
      surface: p.surface,
      error: AppColors.errorRed,
      onSurface: p.textPrimary,
    );
    final text = AppText.textTheme(p);
    OutlineInputBorder fieldBorder(Color color, double width) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: color, width: width),
        );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: p.background,
      canvasColor: p.background,
      textTheme: text,
      extensions: [p],
      splashFactory: InkRipple.splashFactory,
      iconTheme: IconThemeData(color: p.textPrimary),
      dividerTheme: DividerThemeData(color: p.border, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: p.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppText.heading(p),
        iconTheme: IconThemeData(color: p.textPrimary),
        shape: Border(bottom: BorderSide(color: p.border, width: 1)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: p.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.dialog)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: p.surfaceAlt,
        contentTextStyle: AppText.body(p),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          side: const BorderSide(color: AppColors.lineStrong),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: p.brand,
          textStyle: AppText.bodyMedium(p).copyWith(fontWeight: FontWeight.w600),
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        hintStyle: AppText.body(p).copyWith(color: p.textSecondary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: fieldBorder(AppColors.lineStrong, 1),
        border: fieldBorder(AppColors.lineStrong, 1),
        focusedBorder: fieldBorder(AppColors.primaryBlue.withValues(alpha: 0.6), 1.2),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(const StadiumBorder()),
          side: WidgetStateProperty.all(const BorderSide(color: AppColors.lineStrong)),
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
                ? AppColors.primaryBlue.withValues(alpha: 0.12)
                : AppColors.buttonSecondary,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? AppColors.primaryBlue : AppColors.textSecondary,
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? AppColors.cloudWhite : p.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? AppColors.primaryBlue : p.surfaceAlt,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Colors.transparent : AppColors.lineStrong,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primaryBlue),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryBlue,
        selectionColor: AppColors.primaryBlue.withValues(alpha: 0.3),
        selectionHandleColor: AppColors.primaryBlue,
      ),
    );
  }
}
