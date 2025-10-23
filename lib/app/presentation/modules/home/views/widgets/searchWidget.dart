import 'package:flutter/material.dart';

import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../../l10n/app_localizations.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback showFilterBottomSheet;

  const SearchWidget({super.key, required this.showFilterBottomSheet});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: showFilterBottomSheet,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Assets.images.svg.icons.search.svg(
                    width: 20,
                    height: 20,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    context.l10n.searchHint,
                    style: AppTextStyles.poppinsRegular14.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: showFilterBottomSheet,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Assets.images.svg.icons.search.svg(
              width: 20,
              height: 20,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
