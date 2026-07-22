import 'package:flutter/material.dart';

/// MAMYTO design tokens — soft lavender Soft UI / luxury healthcare.
abstract final class AppColors {
  static const primary = Color(0xFF9B7EDE);
  static const primaryDeep = Color(0xFF7B5FC9);
  static const primarySoft = Color(0xFFEDE4FF);
  static const primaryMuted = Color(0xFFD1C4E9);

  static const secondary = Color(0xFFB39DDB);
  static const secondarySoft = Color(0xFFF3EEFF);
  static const accent = Color(0xFFFF8A9B);
  static const accentSoft = Color(0xFFFFE8EC);

  static const background = Color(0xFFF7F5FA);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceGlass = Color(0xE6FFFFFF);

  static const textPrimary = Color(0xFF1F1A2E);
  static const textSecondary = Color(0xFF8A8498);
  static const textOnPrimary = Color(0xFFFFFFFF);

  static const success = Color(0xFF5BC4B0);
  static const successSoft = Color(0xFFE0F5F1);
  static const warning = Color(0xFFFFB74D);
  static const warningSoft = Color(0xFFFFF3E0);
  static const danger = Color(0xFFE57373);
  static const dangerSoft = Color(0xFFFFEBEE);

  static const navBar = Color(0xFF1A1A1E);
  static const navIconInactive = Color(0xFF9A9AA3);

  static const shadow = Color(0x1A1F1A2E);
  static const divider = Color(0x141F1A2E);

  static const chipPrimary = Color(0x269B7EDE);
  static const chipAccent = Color(0x26FF8A9B);
  static const chipTeal = Color(0x265BC4B0);
  static const chipLavender = Color(0x26B39DDB);

  static const gradientHeader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF3EEFF), Color(0xFFF7F5FA)],
  );

  static const gradientHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB39DDB), Color(0xFF9B7EDE), Color(0xFFCE93D8)],
  );

  static const gradientCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF0E8FF), Color(0xFFFFF0F5)],
  );
}

abstract final class AppRadii {
  static const xs = 8.0;
  static const sm = 14.0;
  static const md = 20.0;
  static const lg = 24.0;
  static const xl = 28.0;
  static const pill = 999.0;
}

abstract final class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 20.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 40.0;
  static const page = 20.0;
  static const navClearance = 110.0;
}

abstract final class AppShadows {
  static List<BoxShadow> soft = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 28,
      offset: const Offset(0, 10),
      spreadRadius: -6,
    ),
  ];

  static List<BoxShadow> softSm = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 16,
      offset: const Offset(0, 4),
      spreadRadius: -2,
    ),
  ];

  static List<BoxShadow> float = [
    BoxShadow(
      color: const Color(0x40000000),
      blurRadius: 28,
      offset: const Offset(0, 10),
      spreadRadius: -4,
    ),
  ];

  static List<BoxShadow> glow = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.42),
      blurRadius: 18,
      offset: const Offset(0, 6),
    ),
  ];
}
