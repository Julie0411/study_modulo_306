import 'package:flutter/material.dart';
import '../widgets/apiAccessCard.dart';

class ApiAccessPage extends StatelessWidget {
  final void Function(List flashcards) goFlashcards;
  const ApiAccessPage({super.key, required this.goFlashcards});

  @override
  Widget build(BuildContext context) {
    return ApiAccessCard(title: 'apiAccessCard', goFlashcards: goFlashcards);
  }
}