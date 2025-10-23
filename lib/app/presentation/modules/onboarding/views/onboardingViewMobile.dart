import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../l10n/app_localizations.dart';
import 'models/onboardingPage.dart';
import 'widgets/onboardingContentPage.dart';
import 'widgets/onboardingPageIndicator.dart';

class OnboardingViewMobile extends StatefulWidget {
  const OnboardingViewMobile({super.key});

  @override
  State<OnboardingViewMobile> createState() => _OnboardingViewMobileState();
}

class _OnboardingViewMobileState extends State<OnboardingViewMobile> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingPage> _getPages(BuildContext context) {
    return [
      OnboardingPage(
        image: Assets.images.png.people.image(),
        title: context.l10n.onboarding1MainText,
        description: context.l10n.onboarding1Subtitle,
      ),
      OnboardingPage(
        image: Assets.images.png.woman.image(),
        title: context.l10n.onboarding2MainText,
        description: context.l10n.onboarding2Subtitle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pages = _getPages(context);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingContentPage(page: pages[index]);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => OnboardingPageIndicator(
                          isActive: index == _currentPage),
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          GoRouter.of(context).pushNamed(Routes.home);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        _currentPage == pages.length - 1
                            ? context.l10n.onboarding2Button
                            : context.l10n.onboarding1Button,
                        style: AppTextStyles.poppinsSemiBold16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
