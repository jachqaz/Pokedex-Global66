import 'package:flutter/material.dart';

import '../../../../config/theme/text_styles.dart';

class OnboardingViewMobile extends StatefulWidget {
  const OnboardingViewMobile({super.key});

  @override
  State<OnboardingViewMobile> createState() => _OnboardingViewMobileState();
}

class _OnboardingViewMobileState extends State<OnboardingViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Bienvenido a Pokedex',
      style: AppTextStyles.poppinsMedium32,
      textAlign: TextAlign.center,
    );
  }
}
