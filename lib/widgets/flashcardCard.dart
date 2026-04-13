import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';

class FlashcardCard extends StatelessWidget {
  final String title;

  const FlashcardCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    final flashcardTheme = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
          children: [
            FlashCard(
              frontWidget: Text(
                  'Ciao',
                  style: flashcardTheme
              ),
              backWidget: Text(
                  'Hello',
                  style: flashcardTheme
              )
          ),
            ElevatedButton.icon(
              onPressed: () => print("Avanti"),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Avanti'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ]
      )
    );
  }
}