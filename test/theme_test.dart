import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skytrace/theme/app_theme.dart';
import 'package:skytrace/theme/colors.dart';
import 'package:skytrace/theme/icons.dart';
import 'package:skytrace/widgets/sky_button.dart';

double contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  group('text meets AA on the dark surfaces', () {
    const palette = AppPalette.dark;

    test('primary text', () {
      expect(contrast(palette.textPrimary, palette.background), greaterThanOrEqualTo(4.5));
      expect(contrast(palette.textPrimary, palette.surface), greaterThanOrEqualTo(4.5));
    });

    test('secondary text', () {
      expect(contrast(palette.textSecondary, palette.background), greaterThanOrEqualTo(4.5));
      expect(contrast(palette.textSecondary, palette.surface), greaterThanOrEqualTo(4.5));
      expect(contrast(palette.textSecondary, palette.surfaceAlt), greaterThanOrEqualTo(4.5));
    });

    test('accent colors stay readable on the card surface', () {
      for (final color in [
        AppColors.primaryBlue,
        AppColors.successGreen,
        AppColors.warningAmber,
        AppColors.errorRed,
      ]) {
        expect(contrast(color, palette.surface), greaterThanOrEqualTo(4.5));
      }
    });
  });

  test('light and dark themes share the codesnip palette', () {
    expect(AppTheme.light.scaffoldBackgroundColor, AppColors.ink);
    expect(AppTheme.dark.scaffoldBackgroundColor, AppColors.ink);
  });

  testWidgets('SkyButton renders every variant and reports taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: Scaffold(
          body: Column(
            children: [
              for (final variant in BtnVariant.values)
                SkyButton(
                  label: variant.name,
                  variant: variant,
                  icon: const Ico(AppIcons.check),
                  onPressed: () => taps++,
                ),
            ],
          ),
        ),
      ),
    );

    for (final variant in BtnVariant.values) {
      expect(find.text(variant.name), findsOneWidget);
    }
    await tester.tap(find.text('success'));
    expect(taps, 1);
  });
}
