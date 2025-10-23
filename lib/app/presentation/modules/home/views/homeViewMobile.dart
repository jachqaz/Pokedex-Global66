import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../generated/assets.gen.dart';
import 'widgets/favoritesView.dart';
import 'widgets/pokedexView.dart';
import 'widgets/profileView.dart';
import 'widgets/regionView.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PokedexView(),
    const RegionView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.tapBarActive,
          unselectedItemColor: AppColors.tapBarDefault,
          selectedLabelStyle: AppTextStyles.poppinsRegular12,
          unselectedLabelStyle: AppTextStyles.poppinsRegular12,
          items: [
            BottomNavigationBarItem(
                icon: Assets.images.svg.icons.items.item.svg(
                  color: _currentIndex == 0
                      ? AppColors.buttonPrimary
                      : AppColors.azulSemiLight,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Assets.images.svg.icons.items.item1.svg(
                  color: _currentIndex == 1
                      ? AppColors.buttonPrimary
                      : AppColors.azulSemiLight,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Assets.images.svg.icons.items.item2.svg(
                  color: _currentIndex == 2
                      ? AppColors.buttonPrimary
                      : AppColors.azulSemiLight,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Assets.images.svg.icons.items.item3.svg(
                  color: _currentIndex == 3
                      ? AppColors.buttonPrimary
                      : AppColors.azulSemiLight,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
