import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../global/platformUtils.dart';
import '../controller/onboardingController.dart';
import '../cubit/onboardingCubit.dart';
import '../state/onboardingState.dart';
import 'onboardingViewDesk.dart';
import 'onboardingViewMobile.dart';
import 'onboardingViewWeb.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(
        OnboardingState(),
      )..init(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, Object>(
          builder: (context, state) => SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => RefreshIndicator(
                onRefresh: context.read<OnboardingController>().init,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: Stack(
                      children: [
                        if (PlatformUtils.isWeb) OnboardingViewWeb(),
                        if (PlatformUtils.isMobile) OnboardingViewMobile(),
                        if (PlatformUtils.isDesktop) OnboardingViewDesk()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
