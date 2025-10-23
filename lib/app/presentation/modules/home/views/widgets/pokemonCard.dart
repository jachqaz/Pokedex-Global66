import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/riverpod_providers.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../global/extensions.dart';
import '../../../../global/utils.dart';
import 'pokemonDetailView.dart';
import 'pokemonTypesWidget.dart';

class PokemonCard extends ConsumerWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      color: AppColors.getColorForType(
          pokemon.types?.first?.type?.name?.toLowerCase().trim()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.getColorForType(
              pokemon.types?.first?.type?.name?.toLowerCase().trim()),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => _showPokemonDetail(pokemon, context),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N°${pokemon.id.toString().padLeft(3, '0')}',
                      style: AppTextStyles.poppinsSemiBold12.copyWith(
                        color: AppColors.textCard,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pokemon.name!.capitalize(),
                      style: AppTextStyles.poppinsSemiBold21,
                    ),
                    const SizedBox(height: 12),
                    PokemonTypesWidget(
                        types:
                            pokemon.types?.map((type) => type?.type)
                            .toList())
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: _buildCard(ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        getAssetForType(pokemon: pokemon),
        CachedNetworkImage(
          imageUrl: pokemon.sprites?.frontDefault ?? '',
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(homeStateProvider);
              final isFav = state.favorites.any((p) => p.id == pokemon.id);
              return GestureDetector(
                onTap: () => ref
                    .read(homeStateProvider.notifier)
                    .toggleFavorite(pokemon),
                child: isFav
                    ? Assets.images.svg.icons.favorites.favorite.svg()
                    : Assets.images.svg.icons.favorites.noFavorite.svg(),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showPokemonDetail(Pokemon pokemon, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailView(pokemon: pokemon),
      ),
    );
  }
}
