import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/riverpod_providers.dart';
import '../../../global/platformUtils.dart';
import 'homeViewDesk.dart';
import 'homeViewMobile.dart';
import 'homeViewWeb.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeStateProvider.notifier).loadPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => RefreshIndicator(
            onRefresh: () =>
                ref.read(homeStateProvider.notifier).loadPokemons(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    if (PlatformUtils.isWeb) const HomeViewWeb(),
                    if (PlatformUtils.isMobile) const HomeViewMobile(),
                    if (PlatformUtils.isDesktop) const HomeViewDesk()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
