import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/app_colors.dart';

/// Dark floating pill bottom nav — icons only (Home, Journey, Community, Resources, Profile).
class MamytoBottomNav extends StatelessWidget {
  const MamytoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = <({IconData regular, IconData fill})>[
    (regular: PhosphorIconsRegular.house, fill: PhosphorIconsFill.house),
    (regular: PhosphorIconsRegular.path, fill: PhosphorIconsFill.path),
    (
      regular: PhosphorIconsRegular.chatCircleDots,
      fill: PhosphorIconsFill.chatCircleDots,
    ),
    (regular: PhosphorIconsRegular.bag, fill: PhosphorIconsFill.bag),
    (regular: PhosphorIconsRegular.user, fill: PhosphorIconsFill.user),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.md,
        ),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: AppColors.navBar,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            boxShadow: AppShadows.float,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_items.length, (index) {
              final active = index == currentIndex;
              final icons = _items[index];

              return _NavIcon(
                icon: active ? icons.fill : icons.regular,
                active: active,
                onTap: () => onTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 56,
        height: 56,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            width: active ? 44 : 40,
            height: active ? 44 : 40,
            decoration: BoxDecoration(
              color: active ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: active ? AppShadows.glow : null,
            ),
            child: Icon(
              icon,
              size: 24,
              color: active ? AppColors.textOnPrimary : AppColors.navIconInactive,
            ),
          ),
        ),
      ),
    );
  }
}
