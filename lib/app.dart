import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/settings_provider.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/animations.dart';
import 'theme/app_theme.dart';

class SkyTraceApp extends ConsumerWidget {
  const SkyTraceApp({super.key, this.overlay = false});

  final bool overlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SkyTrace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      builder: (context, child) {
        MotionPrefs.reduce = MediaQuery.disableAnimationsOf(context);
        return child ?? const SizedBox.shrink();
      },
      home: overlay ? const HomeScreen() : const SplashScreen(),
    );
  }
}
