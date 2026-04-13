import 'dart:convert';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlashcardCard extends StatefulWidget {
  final String title;

  const FlashcardCard({super.key, required this.title});

  @override
  State<FlashcardCard> createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard> {
  List flashcards = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    final response =
    await rootBundle.loadString('assets/flashcards.json');

    final data = jsonDecode(response);

    setState(() {
      flashcards = data['flashcards'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final flashcardTheme = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );

    return Container(
      padding: const EdgeInsets.all(20.0),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlashCard(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              frontWidget: Center(
                child: Text(
                  "ciao",
                  style: flashcardTheme,
                  textAlign: TextAlign.center,
                ),
              ),
              backWidget: Center(
                child: Text(
                  "Hello",
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
                  setState(() {
                    if (currentIndex > 0) {
                      currentIndex++;
                    }
                  });
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Indietro'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15
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
                  setState(() {
                    if (currentIndex > 0) {
                      currentIndex++;
                    }
                  });
                  },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Avanti'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}