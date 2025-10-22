import 'package:flutter/material.dart';

import '../../../../config/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.clearFilter,
      style: AppTextStyles.poppinsMedium32,
      textAlign: TextAlign.center,
    );
  }
}
