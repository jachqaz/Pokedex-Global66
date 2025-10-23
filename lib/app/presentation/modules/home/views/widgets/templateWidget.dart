import 'package:flutter/material.dart';

import '../../../../../config/theme/app_text_styles.dart';

class TemplateWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String details;

  const TemplateWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          Text(
            title,
            style: AppTextStyles.poppinsSemiBold20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            details,
            style: AppTextStyles.poppinsRegular14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
