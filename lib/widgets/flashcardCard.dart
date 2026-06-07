import 'package:flash_card/flash_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashcardCard extends StatefulWidget {
  final String title;
  final List flashcards;
  final VoidCallback goAccessPage;

  const FlashcardCard({super.key, required this.title, required this.flashcards, required this.goAccessPage});

  @override
  State<FlashcardCard> createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard> {
  int currentIndex = 0;

  @override
  void didUpdateWidget(FlashcardCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flashcards != widget.flashcards) {
      setState(() => currentIndex = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final flashcards = widget.flashcards;

    if (flashcards.isEmpty) {
      return const SizedBox.shrink();
    }

    final flashcardTheme = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${currentIndex + 1} / ${flashcards.length}'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlashCard(
              key: ValueKey(currentIndex),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              frontWidget: Center(
                child: Text(
                  'Risposta:\n ${flashcards[currentIndex]['back']}',
                  style: flashcardTheme,
                  textAlign: TextAlign.center,
                ),
              ),
              backWidget: Center(
                child: Text(
                  'Domanda:\n ${flashcards[currentIndex]['front']}',
                  style: flashcardTheme,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (currentIndex > 0) setState(() => currentIndex--);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Indietro'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  foregroundColor: Colors.purple[50],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (currentIndex < flashcards.length - 1) {
                    setState(() => currentIndex++);
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Avanti'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  foregroundColor: Colors.purple[50],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: widget.goAccessPage,
              icon: const Icon(CupertinoIcons.sparkles),
              label: const Text('Genera ancora'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
