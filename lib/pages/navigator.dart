import 'package:flutter/material.dart';
import 'package:study_modulo_306/pages/navigation_card.dart';

class NavigationCards extends StatelessWidget {
  const NavigationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationCard(
          icon: Icons.timer,
          label: 'Pomodoro',
        ),
        NavigationCard(
          icon: Icons.check_box_outlined,
          label: 'Tasks',
        ),
        NavigationCard(
          icon: Icons.lightbulb_outline,
          label: 'Flashcards',
        ),
      ],
    );
  }
}