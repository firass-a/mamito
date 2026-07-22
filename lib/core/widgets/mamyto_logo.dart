import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Brand assets for MAMYTO.
abstract final class BrandAssets {
  static const logoFull = 'assets/branding/mamyto_logo_full.png';
  static const logoDark = 'assets/branding/mamyto_logo.png';
  static const icon = 'assets/branding/mamyto_icon.png';
}

/// Circular mother-and-baby emblem (app icon mark).
class MamytoMark extends StatelessWidget {
  const MamytoMark({
    super.key,
    this.size = 96,
    this.glow = false,
  });

  final double size;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.28),
                  blurRadius: size * 0.22,
                  offset: Offset(0, size * 0.08),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        BrandAssets.icon,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

/// Full vertical logo (emblem + wordmark + tagline) for splash / about.
class MamytoLogo extends StatelessWidget {
  const MamytoLogo({
    super.key,
    this.width = 220,
    this.darkBackground = false,
  });

  final double width;
  final bool darkBackground;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      darkBackground ? BrandAssets.logoDark : BrandAssets.logoFull,
      width: width,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}

/// Mirrors chevron/arrow icons correctly in RTL.
class DirectionalIcon extends StatelessWidget {
  const DirectionalIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
  });

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final child = Icon(icon, size: size, color: color);
    if (!rtl) return child;
    return Transform.scale(scaleX: -1, child: child);
  }
}
