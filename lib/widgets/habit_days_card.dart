// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HabitDaysCard extends StatefulWidget {
  const HabitDaysCard({
    super.key,
  });

  @override
  State<HabitDaysCard> createState() => _HabitDaysCardState();
}

class _HabitDaysCardState extends State<HabitDaysCard> {
  bool _showDays = false;
  final List<String> _weekDays = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'];
  final Set<int> _selectedDays = {};

  void _toggleDay(int index) {
    setState(() {
      if (_selectedDays.contains(index)) {
        _selectedDays.remove(index);
        return;
      }
    
      _selectedDays.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showDays = !_showDays;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Card(
                  color: AppColors.white,
                  shadowColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dias do hábito',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              _selectedDays.isEmpty
                                  ? 'Selecione os dias'
                                  : _selectedDays.length == 7
                                      ? 'Todos os dias'
                                      : _selectedDays.map((index) => _weekDays[index][0]).join(', '),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right, 
                              color: AppColors.accent, 
                              size: 42
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_showDays)
            Positioned(
              top: -20,
              left: 20,
              right: 0,
              child: Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_weekDays.length, (index) {
                        final isSelected = _selectedDays.contains(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Text(
                              _weekDays[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? AppColors.primary : Colors.black87,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: AppColors.primary.withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            onSelected: (_) => _toggleDay(index),
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: isSelected ? AppColors.primary : Colors.transparent,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}