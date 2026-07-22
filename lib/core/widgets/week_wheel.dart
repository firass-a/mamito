import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Large circular pregnancy week tracker (1–40).
class WeekWheel extends StatelessWidget {
  const WeekWheel({
    super.key,
    required this.currentWeek,
    this.totalWeeks = 40,
    this.size = 260,
    this.centerLabel,
  });

  final int currentWeek;
  final int totalWeeks;
  final double size;
  final String? centerLabel;

  @override
  Widget build(BuildContext context) {
    final week = currentWeek.clamp(1, totalWeeks);
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _WeekWheelPainter(
          currentWeek: week,
          totalWeeks: totalWeeks,
          textDirection: Directionality.of(context),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_rounded,
                color: AppColors.primary.withValues(alpha: 0.9),
                size: 26,
              ),
              const SizedBox(height: 4),
              Text(
                '$week',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.primaryDeep,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              if (centerLabel != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    centerLabel!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeekWheelPainter extends CustomPainter {
  _WeekWheelPainter({
    required this.currentWeek,
    required this.totalWeeks,
    required this.textDirection,
  });

  final int currentWeek;
  final int totalWeeks;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 28;
    const trackWidth = 18.0;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.primarySoft
        ..style = PaintingStyle.stroke
        ..strokeWidth = trackWidth
        ..strokeCap = StrokeCap.round,
    );

    final sweep = (currentWeek / totalWeeks) * 2 * math.pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..shader = SweepGradient(
          startAngle: -math.pi / 2,
          colors: const [
            AppColors.primary,
            Color(0xFFCE93D8),
            AppColors.primaryDeep,
          ],
          transform: const GradientRotation(-math.pi / 2),
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = trackWidth
        ..strokeCap = StrokeCap.round,
    );

    for (var w = 1; w <= totalWeeks; w++) {
      if (w != 1 && w != totalWeeks && w % 5 != 0 && w != currentWeek) continue;
      final angle = -math.pi / 2 + (w / totalWeeks) * 2 * math.pi;
      final isCurrent = w == currentWeek;
      final r = radius + (isCurrent ? 22 : 20);
      final pos = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
      if (isCurrent) {
        canvas.drawCircle(pos, 11, Paint()..color = AppColors.primary);
      }
      final tp = TextPainter(
        text: TextSpan(
          text: '$w',
          style: TextStyle(
            color: isCurrent ? AppColors.textOnPrimary : AppColors.textSecondary,
            fontSize: isCurrent ? 9 : 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: textDirection,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }

    for (final milestone in [12, 20, 28, 36]) {
      if (milestone > totalWeeks) continue;
      final angle = -math.pi / 2 + (milestone / totalWeeks) * 2 * math.pi;
      final pos = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawCircle(
        pos,
        5,
        Paint()
          ..color = milestone <= currentWeek
              ? AppColors.surface
              : AppColors.success.withValues(alpha: 0.75),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WeekWheelPainter old) =>
      old.currentWeek != currentWeek || old.totalWeeks != totalWeeks;
}
