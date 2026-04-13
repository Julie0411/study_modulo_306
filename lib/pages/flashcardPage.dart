import 'package:flutter/material.dart';
import '../widgets/flashcardCard.dart';

class FlashcardsPage extends StatelessWidget {
  const FlashcardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlashcardCard(title: 'Flashcards');
  }
}