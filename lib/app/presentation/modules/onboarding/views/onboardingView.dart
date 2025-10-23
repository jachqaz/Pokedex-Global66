import 'package:flutter/material.dart';

import '../../../global/platformUtils.dart';
import 'onboardingViewDesk.dart';
import 'onboardingViewMobile.dart';
import 'onboardingViewWeb.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  if (PlatformUtils.isWeb) const OnboardingViewWeb(),
                  if (PlatformUtils.isMobile) const OnboardingViewMobile(),
                  if (PlatformUtils.isDesktop) const OnboardingViewDesk()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
