import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/suggestion_card.dart';
import '../widgets/habit_days_card.dart';
import '../widgets/reminder_card.dart';
import '../widgets/icon_selector.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';

class CreateGoalsScreen extends StatefulWidget {
  const CreateGoalsScreen({super.key});

  @override
  State<CreateGoalsScreen> createState() => _CreateGoalsScreenState();
}

class _CreateGoalsScreenState extends State<CreateGoalsScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final provider = Provider.of<GoalProvider>(context);
    if (provider.selectedText != null) {
      _textController.text = provider.selectedText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 75.0, left: 24.0, bottom: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTitle('Defina sua meta'),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconSelector(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: TextField(
                              controller: _textController,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Ex: Memorizar um versículo',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grayText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0),
                      FormTitle('Frequência'),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              HabitDaysCard(),
                              ReminderCard(),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTitle('Sugestões'),
                      SizedBox(height: 15.0),
                      SuggestionCard('Fazer devocional', Icons.menu_book),
                      SuggestionCard('Orar', Icons.chat_bubble_outline),
                      SuggestionCard('Jejuar', Icons.restaurant_menu),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 14.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(
                        color: AppColors.primary,
                        width: .5
                      )
                    ),
                  ),
                  child: Text(
                    'Criar meta',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}