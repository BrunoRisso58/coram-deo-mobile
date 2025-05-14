import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class IconSelector extends StatefulWidget {
  @override
  _IconSelectorState createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  IconData _selectedIcon = Icons.menu_book;

  final List<IconData> availableIcons = [
    Icons.menu_book,          // Leitura bíblica
    Icons.auto_stories,       // Devocional / meditação
    Icons.library_books,      // Estudo bíblico
    Icons.lightbulb,          // Sabedoria / discernimento
    Icons.favorite_border,    // Amar ao próximo
    Icons.handshake,          // Discipulado / mentoria
    Icons.check_circle,       // Obediência / fidelidade
    Icons.mood,               // Fruto do Espírito
    Icons.volunteer_activism, // Serviço / ajudar alguém
    Icons.schedule,           // Rotina devocional
    Icons.bolt,               // Santidade / renúncia
    Icons.visibility,         // Vigilância
    Icons.clean_hands,        // Pureza / integridade
    Icons.people,             // Comunhão / célula
    Icons.chat,               // Conversas edificantes
    Icons.campaign,           // Evangelismo
    Icons.heart_broken,       // Perdoar alguém
    Icons.thumb_up,           // Encorajar / servir
    Icons.bedtime,            // Descanso
    Icons.fitness_center,     // Exercício
    Icons.local_cafe,         // Pausa / café com Deus
    Icons.book,               // Leitura cristã
    Icons.music_note,         // Louvor
    Icons.edit_note,          // Diário espiritual
    Icons.task,               // Lista de oração
    Icons.alarm,              // Lembrete de oração
    Icons.event_note,         // Planejamento espiritual
    Icons.settings_suggest,   // Revisar metas
  ];

  void _openIconPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 5,
            children: availableIcons.map((icon) {
              return IconButton(
                icon: Icon(
                  icon,
                  color: AppColors.accent,
                  size: 26
                ),
                onPressed: () {
                  setState(() {
                    _selectedIcon = icon;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 8.0, left: 8.0),
      child: GestureDetector(
        onTap: _openIconPicker,
        child: Icon(
          _selectedIcon,
          color: AppColors.accent,
          size: 26,
        ),
      ),
    );
  }
}