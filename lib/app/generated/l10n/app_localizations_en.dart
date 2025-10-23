// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get pokedexTitle => 'Pokedex';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get profileTitle => 'Profile';

  @override
  String get regionsTitle => 'Regions';

  @override
  String get onboarding01Title => 'Onboarding 01';

  @override
  String get onboarding02Title => 'Onboarding 02';

  @override
  String get onboarding1MainText => 'All Pokémon in one place';

  @override
  String get onboarding1Subtitle =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboarding1Button => 'Continue';

  @override
  String get onboarding2MainText => 'Keep your Pokedex updated';

  @override
  String get onboarding2Subtitle =>
      'Register and save your profile, favorite Pokémon, configurations, and much more in the application';

  @override
  String get onboarding2Button => 'Let\'s Start';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get resultsFound => '3 results found';

  @override
  String get clearFilter => 'Clear filter';

  @override
  String get weightLabel => 'WEIGHT';

  @override
  String get heightLabel => 'HEIGHT';

  @override
  String get categoryLabel => 'CATEGORY';

  @override
  String get abilityLabel => 'ABILITY';

  @override
  String get genderLabel => 'GENDER';

  @override
  String get weaknessesLabel => 'Weaknesses';

  @override
  String get plantType => 'Plant';

  @override
  String get poisonType => 'Poison';

  @override
  String get fireType => 'Fire';

  @override
  String get psychicType => 'Psychic';

  @override
  String get iceType => 'Ice';

  @override
  String get flyingType => 'Flying';

  @override
  String get waterType => 'Water';

  @override
  String get dragonType => 'Dragon';

  @override
  String get electricType => 'Electric';

  @override
  String get fairyType => 'Fairy';

  @override
  String get ghostType => 'Ghost';

  @override
  String get seedCategory => 'SEED';

  @override
  String get overgrowthAbility => 'Overgrowth';

  @override
  String get bulbasaurDescription =>
      'It has a seed of a plant on its back since it was born. The seed grows slowly.';

  @override
  String get filterTitle => 'Filter by your preferences';

  @override
  String get filterTypeHeader => 'Type';

  @override
  String get filterApplyButton => 'Apply';

  @override
  String get filterCancelButton => 'Cancel';

  @override
  String get generalErrorMessage => 'Something went wrong...';

  @override
  String get generalErrorDetails =>
      'We couldn\'t load the information at the moment. Check your connection or try again later.';

  @override
  String get retryButton => 'Retry';

  @override
  String get noFavoritesMessage =>
      'You haven\'t marked any Pokémon as favorite';

  @override
  String get noFavoritesDetails =>
      'Click the heart icon on your favorite Pokémon and they will appear here.';

  @override
  String get constructionTitle => 'Coming soon!';

  @override
  String get constructionDetails =>
      'We are working hard to bring you this section. Check back later to discover all the news.';

  @override
  String get emptyTitle => 'No Pokémon found';

  @override
  String get emptyContent => 'Try other search filters';
}
