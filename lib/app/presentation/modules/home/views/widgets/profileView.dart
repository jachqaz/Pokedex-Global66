import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../../l10n/app_localizations.dart';
import 'templateWidget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // return TemplateWidget(
    //     image: Assets.images.png.jigglypuff.image(),
    //     title: context.l10n.constructionTitle,
    //     details: context.l10n.constructionDetails);
    return TemplateWidget(
        image: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Assets.images.png.magikarp.image(),
        ),
        title: context.l10n.generalErrorMessage,
        details: context.l10n.generalErrorDetails);
  }
}
