import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../global/extensions.dart';
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
          // Header con fondo verde
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Barra superior
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  // Círculo decorativo y Pokémon
                  Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              width: 150,
                              height: 150,
                              imageUrl: pokemon
                                      .sprites?.other.showdown?.frontDefault ??
                                  '',
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Contenido principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre y número
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
                  // Tipos
                  PokemonTypesWidget(pokemon: pokemon),
                  const SizedBox(height: 20),
                  // Descripción
                  Text(
                    'Tiene una semilla de planta en la espalda desde que nace. La semilla crece lentamente.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Estadísticas
                  Row(
                    children: [
                      Expanded(
                          child: _buildStatCard(
                              'PESO', '6,9 kg', Icons.monitor_weight_outlined)),
                      const SizedBox(width: 12),
                      Expanded(
                          child:
                              _buildStatCard('ALTURA', '0,7 m', Icons.height)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _buildStatCard(
                              'CATEGORÍA', 'SEMILLA', Icons.category_outlined)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildStatCard('HABILIDAD', 'Espesura',
                              Icons.flash_on_outlined)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Género
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
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.female, color: Colors.pink, size: 16),
                          Text(' 12,5%',
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Debilidades
                  Text(
                    'Debilidades',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  PokemonTypesWidget(pokemon: pokemon),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pokédex'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Regiones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildTypeChip(String type, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
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

  Widget _buildWeaknessChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.getColorForType(type).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.getColorForType(type).withOpacity(0.3),
        ),
      ),
      child: Text(
        type,
        style: AppTextStyles.poppinsRegular12.copyWith(
          color: AppColors.getColorForType(type),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
