import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon.dart';
import '../../../../../generated/assets.gen.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.azulNormal),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    pokemon.name,
                    style: AppTextStyles.poppinsMedium24.copyWith(
                      color: AppColors.azulNormal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  pokemon.number,
                  style: AppTextStyles.poppinsMedium18.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _getTypeColor(pokemon.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: _getTypeColor(pokemon.type).withOpacity(0.3),
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Assets.images.png.people.image(
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                pokemon.description,
                style: AppTextStyles.poppinsRegular16.copyWith(
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('PESO', pokemon.weight),
                  _buildStatItem('ALTURA', pokemon.height),
                  _buildStatItem('CATEGORÍA', pokemon.category),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Debilidades',
                style: AppTextStyles.poppinsMedium18.copyWith(
                  color: AppColors.azulNormal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildWeaknessChip('Fuego'),
                  _buildWeaknessChip('Volador'),
                  _buildWeaknessChip('Hielo'),
                  _buildWeaknessChip('Psíquico'),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.poppinsRegular12.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.poppinsMedium16.copyWith(
            color: AppColors.azulNormal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildWeaknessChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getTypeColor(type).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _getTypeColor(type).withOpacity(0.3),
        ),
      ),
      child: Text(
        type,
        style: AppTextStyles.poppinsRegular12.copyWith(
          color: _getTypeColor(type),
          fontWeight: FontWeight.w500,
        ),
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

      case 'hielo':
        return const Color(0xFF98D8D8);

      case 'psíquico':
        return const Color(0xFFF85888);

      default:
        return AppColors.azulNormal;
    }
  }
}
