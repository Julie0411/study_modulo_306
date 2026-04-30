import 'package:flutter/material.dart';
import '../widgets/flashcardCard.dart';

class FlashcardPage extends StatelessWidget {
  final VoidCallback goAccessPage;
  const FlashcardPage({super.key, required this.goAccessPage});

  @override
  Widget build(BuildContext context) {
    return FlashcardCard(title: 'Flashcards', goAccessPage: goAccessPage);
  }
}