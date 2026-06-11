import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiAccessCard extends StatefulWidget {
  final String title;
  final void Function(List flashcards) goFlashcards;

  const ApiAccessCard({
    super.key,
    required this.title,
    required this.goFlashcards,
  });

  @override
  State<ApiAccessCard> createState() => _ApiAccessCardState();
}

class _ApiAccessCardState extends State<ApiAccessCard> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _textScrollController = ScrollController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    _textScrollController.dispose();
    super.dispose();
  }

  Future<void> _onGenera() async {
    final tema = _controller.text.trim();
    if (tema.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('http://localhost:11434/api/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "model": "gemma3n",
          "stream": false,
          "messages": [
            {
              "role": "system",
              "content": """You are an assistant that generates educational flashcards.
              Respond ONLY with valid JSON, without backticks or Markdown.
              Format: {“flashcards”: [{“front”: “question”, ‘back’: “answer”}]}
              When it comes to languages, unless the user specifies otherwise, use Italian as the front and the other language as the back.
              Generate at least 10 flashcards, but if the user provides a number of flashcards, use the number they provided"""
            },
            {"role": "user", "content": "Genera flashcard sul tema: $tema"}
          ]
        }),
      );

      final data = jsonDecode(response.body);
      String content = data['message']['content']
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/flashcards.json');
      await file.writeAsString(content);
      print('FILE SCRITTO: ${file.path}');
      print('CONTENUTO: $content');

      final decoded = jsonDecode(content);
      widget.goFlashcards(decoded['flashcards'] as List);
      _controller.clear();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Inserisci il tema sulla quale vuoi generare le flashcard',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Scrollbar(
            controller: _textScrollController,
            thumbVisibility: true,
            child: TextField(
              controller: _controller,
              scrollController: _textScrollController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 6,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          _isLoading
            ? CircularProgressIndicator(color: Colors.deepPurple)
            : ElevatedButton.icon(
                onPressed: _onGenera,
                icon: const Icon(CupertinoIcons.sparkles),
                label: const Text('Genera le flashcard'),
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
        ],
      ),
    );
  }
}
