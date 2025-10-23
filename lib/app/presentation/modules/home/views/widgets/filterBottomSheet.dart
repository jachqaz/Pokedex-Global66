import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../global/enums.dart';
import '../../../../global/extensions.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<String> selectedTypes;
  final Function(List<String>) onFiltersChanged;
  final VoidCallback onApply;

  const FilterBottomSheet({
    super.key,
    required this.selectedTypes,
    required this.onFiltersChanged,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => FilterBottomSheetState();
}

class FilterBottomSheetState extends State<FilterBottomSheet> {
  late List<String> _selectedTypes;
  bool _isTypeExpanded = true;

  @override
  void initState() {
    super.initState();
    _selectedTypes = List.from(widget.selectedTypes);
  }

  void _toggleTypeSelection(String spanishType) {
    final englishType = TypeTranslator.toEnglish(spanishType);
    setState(() {
      if (_selectedTypes.contains(englishType)) {
        _selectedTypes.remove(englishType);
      } else {
        _selectedTypes.add(englishType);
      }
    });
  }

  Widget _buildCheckbox(bool isSelected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.checkboxSelected : AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? AppColors.checkboxSelected : Colors.grey.shade400,
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Icon(
              Icons.check,
              size: 16,
              color: AppColors.white,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 24.0, right: 24.0, bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: 28, color: AppColors.black),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      context.l10n.filterTitle,
                      style: AppTextStyles.poppinsSemiBold20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isTypeExpanded = !_isTypeExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.filterTypeHeader,
                    style: AppTextStyles.poppinsSemiBold16,
                  ),
                  Icon(
                    _isTypeExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Colors.grey),
          if (_isTypeExpanded)
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                itemCount: TipoPokemon.values.length,
                itemBuilder: (context, index) {
                  final type = TipoPokemon.values[index];
                  final spanishName = type.name;
                  final englishName = TypeTranslator.toEnglish(spanishName);
                  final isSelected = _selectedTypes.contains(englishName);

                  return InkWell(
                    onTap: () => _toggleTypeSelection(spanishName),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              spanishName,
                              style: AppTextStyles.poppinsRegular14.copyWith(
                                color: AppColors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          _buildCheckbox(isSelected),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          if (_isTypeExpanded) const SizedBox(height: 1),
          Container(
            padding: EdgeInsets.fromLTRB(
                24, 16, 24, 16 + MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onFiltersChanged(_selectedTypes);
                      widget.onApply();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      context.l10n.filterApplyButton,
                      style: AppTextStyles.poppinsSemiBold18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.buttonCancel,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      context.l10n.filterCancelButton,
                      style: AppTextStyles.poppinsSemiBold18.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
