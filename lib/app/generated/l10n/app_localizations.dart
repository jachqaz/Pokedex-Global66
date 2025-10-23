import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @pokedexTitle.
  ///
  /// In en, this message translates to:
  /// **'Pokedex'**
  String get pokedexTitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @regionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regionsTitle;

  /// No description provided for @onboarding01Title.
  ///
  /// In en, this message translates to:
  /// **'Onboarding 01'**
  String get onboarding01Title;

  /// No description provided for @onboarding02Title.
  ///
  /// In en, this message translates to:
  /// **'Onboarding 02'**
  String get onboarding02Title;

  /// No description provided for @onboarding1MainText.
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in one place'**
  String get onboarding1MainText;

  /// No description provided for @onboarding1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo'**
  String get onboarding1Subtitle;

  /// No description provided for @onboarding1Button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboarding1Button;

  /// No description provided for @onboarding2MainText.
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokedex updated'**
  String get onboarding2MainText;

  /// No description provided for @onboarding2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Register and save your profile, favorite Pokémon, configurations, and much more in the application'**
  String get onboarding2Subtitle;

  /// No description provided for @onboarding2Button.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get onboarding2Button;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get searchHint;

  /// No description provided for @resultsFound.
  ///
  /// In en, this message translates to:
  /// **'3 results found'**
  String get resultsFound;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get weightLabel;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'HEIGHT'**
  String get heightLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get categoryLabel;

  /// No description provided for @abilityLabel.
  ///
  /// In en, this message translates to:
  /// **'ABILITY'**
  String get abilityLabel;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get genderLabel;

  /// No description provided for @weaknessesLabel.
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknessesLabel;

  /// No description provided for @plantType.
  ///
  /// In en, this message translates to:
  /// **'Plant'**
  String get plantType;

  /// No description provided for @poisonType.
  ///
  /// In en, this message translates to:
  /// **'Poison'**
  String get poisonType;

  /// No description provided for @fireType.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get fireType;

  /// No description provided for @psychicType.
  ///
  /// In en, this message translates to:
  /// **'Psychic'**
  String get psychicType;

  /// No description provided for @iceType.
  ///
  /// In en, this message translates to:
  /// **'Ice'**
  String get iceType;

  /// No description provided for @flyingType.
  ///
  /// In en, this message translates to:
  /// **'Flying'**
  String get flyingType;

  /// No description provided for @waterType.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get waterType;

  /// No description provided for @dragonType.
  ///
  /// In en, this message translates to:
  /// **'Dragon'**
  String get dragonType;

  /// No description provided for @electricType.
  ///
  /// In en, this message translates to:
  /// **'Electric'**
  String get electricType;

  /// No description provided for @fairyType.
  ///
  /// In en, this message translates to:
  /// **'Fairy'**
  String get fairyType;

  /// No description provided for @ghostType.
  ///
  /// In en, this message translates to:
  /// **'Ghost'**
  String get ghostType;

  /// No description provided for @seedCategory.
  ///
  /// In en, this message translates to:
  /// **'SEED'**
  String get seedCategory;

  /// No description provided for @overgrowthAbility.
  ///
  /// In en, this message translates to:
  /// **'Overgrowth'**
  String get overgrowthAbility;

  /// No description provided for @bulbasaurDescription.
  ///
  /// In en, this message translates to:
  /// **'It has a seed of a plant on its back since it was born. The seed grows slowly.'**
  String get bulbasaurDescription;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterTitle;

  /// No description provided for @filterTypeHeader.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get filterTypeHeader;

  /// No description provided for @filterApplyButton.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filterApplyButton;

  /// No description provided for @filterCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get filterCancelButton;

  /// No description provided for @generalErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get generalErrorMessage;

  /// No description provided for @generalErrorDetails.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the information at the moment. Check your connection or try again later.'**
  String get generalErrorDetails;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @noFavoritesMessage.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t marked any Pokémon as favorite'**
  String get noFavoritesMessage;

  /// No description provided for @noFavoritesDetails.
  ///
  /// In en, this message translates to:
  /// **'Click the heart icon on your favorite Pokémon and they will appear here.'**
  String get noFavoritesDetails;

  /// No description provided for @constructionTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon!'**
  String get constructionTitle;

  /// No description provided for @constructionDetails.
  ///
  /// In en, this message translates to:
  /// **'We are working hard to bring you this section. Check back later to discover all the news.'**
  String get constructionDetails;

  /// No description provided for @emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Pokémon found'**
  String get emptyTitle;

  /// No description provided for @emptyContent.
  ///
  /// In en, this message translates to:
  /// **'Try other search filters'**
  String get emptyContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
