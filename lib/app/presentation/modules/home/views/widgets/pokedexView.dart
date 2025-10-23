import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../../l10n/app_localizations.dart';
import 'filterBottomSheet.dart';
import 'pokemonCard.dart';
import 'searchWidget.dart';
import 'templateWidget.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({super.key});

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final TextEditingController _searchController = TextEditingController();
  List<Pokemon> _filteredPokemonList = [];
  List<String> _selectedTypes = [];
  bool _hasActiveFilters = false;

  @override
  void initState() {
    super.initState();
    _filteredPokemonList = samplePokemons;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      _filteredPokemonList = samplePokemons.where((pokemon) {
        final matchesSearch = _searchController.text.isEmpty ||
            pokemon.name
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            pokemon.number
                .toLowerCase()
                .contains(_searchController.text.toLowerCase());

        final matchesType = _selectedTypes.isEmpty ||
            _selectedTypes.any((type) =>
                pokemon.type.toLowerCase().contains(type.toLowerCase()));

        return matchesSearch && matchesType;
      }).toList();

      _hasActiveFilters =
          _searchController.text.isNotEmpty || _selectedTypes.isNotEmpty;
    });
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FilterBottomSheet(
          selectedTypes: _selectedTypes,
          onFiltersChanged: (newSelectedTypes) {
            setState(() {
              _selectedTypes = newSelectedTypes;
            });
          },
          onApply: () {
            _applyFilters();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          SearchWidget(showFilterBottomSheet: () {
            _showFilterBottomSheet();
          }),
          const SizedBox(height: 16),
          if (_hasActiveFilters) ...[
            Row(
              children: [
                Text(
                  'Se han encontrado ${_filteredPokemonList.length} resultados:',
                  style: AppTextStyles.poppinsRegular14.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchController.clear();
                      _selectedTypes.clear();
                      _applyFilters();
                    });
                  },
                  child: Text(
                    'Borrar filtro',
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: AppColors.buttonPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          Expanded(
            child: _filteredPokemonList.isEmpty
                ? TemplateWidget(
                    image: Assets.images.png.jigglypuff.image(),
                    title: context.l10n.emptyTitle,
                    details: context.l10n.emptyContent)
                : ListView.builder(
                    itemCount: _filteredPokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = _filteredPokemonList[index];
                      return PokemonCard(pokemon: pokemon);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
