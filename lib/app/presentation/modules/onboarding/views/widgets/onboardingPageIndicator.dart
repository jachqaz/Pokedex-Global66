import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final bool isActive;

  const OnboardingPageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.azulNormal : AppColors.azulSemiLight,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
