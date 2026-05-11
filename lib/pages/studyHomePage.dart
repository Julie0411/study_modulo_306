import 'package:flutter/material.dart';
import 'package:study_modulo_306/pages/pomodoroPage.dart';
import 'package:study_modulo_306/pages/taskPage.dart';
import '../widgets/navigationCard.dart';
import '../widgets/studyHeader.dart';
import 'apiAccessPage.dart';
import 'flashcardPage.dart';

class StudyHomePage extends StatefulWidget {

  const StudyHomePage({super.key});

  @override
  State<StudyHomePage> createState() => _StudySpaceHomePageState();

}

class _StudySpaceHomePageState extends State<StudyHomePage> {

  int selectedIndex = 0;
  List _flashcards = [];

  void handleGoFlashcards(List flashcards) {
    setState(() {
      _flashcards = flashcards;
      selectedIndex = 3;
    });
  }

  void handleSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const PomodoroPage(),
      const TasksPage(),
      ApiAccessPage(
        goFlashcards: handleGoFlashcards,
      ),
      FlashcardPage(
        flashcards: _flashcards,
        goAccessPage: () => handleSelected(2),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF0F0FF),
              Color(0xFFE0F0FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const StudyHeader(),
                const SizedBox(height: 30),
                NavigationCards(
                  selectedIndex: selectedIndex,
                  onSelected: handleSelected,
                ),
                const SizedBox(height: 30),
                IndexedStack(
                  index: selectedIndex,
                  children: pages,
                ),
                SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}