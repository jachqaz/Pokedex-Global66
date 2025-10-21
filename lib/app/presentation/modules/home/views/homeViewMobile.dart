import 'package:flutter/material.dart';

import '../../../../config/theme/text_styles.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Título Principal',
      style: AppTextStyles.poppinsMedium32,
      textAlign: TextAlign.center,
    );
  }
}
