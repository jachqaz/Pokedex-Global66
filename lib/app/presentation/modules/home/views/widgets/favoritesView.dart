import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../../l10n/app_localizations.dart';
import 'pokemonCard.dart';
import 'templateWidget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<Pokemon> _favoritePokemons = [];

  @override
  Widget build(BuildContext context) {
    return _favoritePokemons.isEmpty
        ? _buildEmptyState()
        : _buildFavoritesList();
  }

  Widget _buildEmptyState() {
    return TemplateWidget(
        image: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Assets.images.png.magikarp.image(),
        ),
        title: context.l10n.noFavoritesMessage,
        details: context.l10n.noFavoritesDetails);
  }

  Widget _buildFavoritesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _favoritePokemons.length,
              itemBuilder: (context, index) {
                final pokemon = _favoritePokemons[index];
                return _buildFavoriteItem(pokemon, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(Pokemon pokemon, int index) {
    return Dismissible(
      key: Key(pokemon.id.toString()),
      direction: DismissDirection.endToStart,
      background: _buildDismissibleBackground(),
      secondaryBackground: _buildDismissibleSecondaryBackground(),
      confirmDismiss: (direction) async {
        return await _showDeleteConfirmationDialog(
            context, pokemon.name.toString());
      },
      onDismissed: (direction) {
        _removeFavorite(index);
      },
      child: PokemonCard(pokemon: pokemon),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildDismissibleSecondaryBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: Assets.images.svg.icons.trash.svg(),
    );
  }

  Future<bool> _showDeleteConfirmationDialog(
      BuildContext context, String pokemonName) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                context.l10n.filterCancelButton,
                style: AppTextStyles.poppinsMedium18,
              ),
              content: Text(
                context.l10n.filterCancelButton,
                style: AppTextStyles.poppinsRegular14,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    context.l10n.filterCancelButton,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: AppColors.azulNormal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    context.l10n.filterCancelButton,
                    style: AppTextStyles.poppinsMedium14,
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _removeFavorite(int index) {
    setState(() {
      _favoritePokemons.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.l10n.filterCancelButton),
        backgroundColor: AppColors.buttonPrimary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'planta':
        return const Color(0xFF78C850);
      case 'veneno':
        return const Color(0xFFA040A0);
      case 'fuego':
        return const Color(0xFFF08030);
      case 'volador':
        return const Color(0xFFA890F0);
      case 'agua':
        return const Color(0xFF6890F0);
      default:
        return AppColors.azulNormal;
    }
  }
}
