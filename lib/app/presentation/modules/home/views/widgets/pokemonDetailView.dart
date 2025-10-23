import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../global/extensions.dart';
import '../../../../global/utils.dart';
import 'pokemonTypesWidget.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getColorForType(
        pokemon.types?.first?.type?.name?.toLowerCase().trim());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
            Stack(
              children: [
                ClipPath(
                  clipper: _CurvedHeaderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back,
                                      color: Colors.white, size: 28),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border,
                                      color: Colors.white, size: 28),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Transform.scale(
                                scale: 1.5,
                                child: getAssetForType(
                                    property: pokemon.types?.first?.type?.name),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      width: 150,
                      height: 150,
                      imageUrl:
                          pokemon.sprites?.other.showdown?.frontDefault ?? '',
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name!.capitalize(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'N°${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                    PokemonTypesWidget(
                        types:
                            pokemon.types?.map((type) => type?.type).toList()),
                    const SizedBox(height: 20),
                    Text(pokemon.flavorText?.replaceAll('\n', ' ') ?? '',
                        style: AppTextStyles.poppinsRegular14),
                    const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                          child: _buildStatCard(
                                context.l10n.weight.capitalize(),
                                '${pokemon.weight} kg',
                                Icons.monitor_weight_outlined)),
                        const SizedBox(width: 12),
                      Expanded(
                            child: _buildStatCard(
                                context.l10n.height.capitalize(),
                                '${pokemon.height} m',
                                Icons.height)),
                      ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _buildStatCard(
                                context.l10n.type.capitalize(),
                                pokemon.types?.first?.type?.name
                                        ?.capitalize() ??
                                    '',
                                Icons.category_outlined)),
                        const SizedBox(width: 12),
                      Expanded(
                            child: _buildStatCard(
                                context.l10n.skill.capitalize(),
                                pokemon.moves?.first?.move.name?.capitalize() ??
                                    '',
                                Icons.flash_on_outlined)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'GÉNERO',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 87,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 13,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.male, color: Colors.blue, size: 16),
                          Text(' 87,5%',
                              style: TextStyle(
                                    color: Colors.blue, fontSize: 14)),
                          ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.female, color: Colors.pink, size: 16),
                          Text(' 12,5%',
                              style: TextStyle(
                                    color: Colors.pink, fontSize: 14)),
                          ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                      context.l10n.weakness.capitalize(),
                      style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                    PokemonTypesWidget(types: pokemon.damageRelations!),
                    const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
        ));
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 1.1,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
