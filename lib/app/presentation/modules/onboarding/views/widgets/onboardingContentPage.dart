import 'package:flutter/material.dart';

import '../../../../../config/theme/app_text_styles.dart';
import 'models/onboardingPage.dart';

class OnboardingContentPage extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingContentPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          page.image,
          const SizedBox(height: 48),
          Text(
            page.title,
            style: AppTextStyles.poppinsMedium26,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            style: AppTextStyles.poppinsRegular14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
