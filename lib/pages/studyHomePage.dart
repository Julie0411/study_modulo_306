import 'package:flutter/material.dart';
import 'package:study_modulo_306/pages/pomodoroPage.dart';
import 'package:study_modulo_306/pages/taskPage.dart';
import '../widgets/navigationCard.dart';
import '../widgets/studyHeader.dart';
import 'flashcardPage.dart';

class StudyHomePage extends StatefulWidget {

  const StudyHomePage({super.key});

  @override
  State<StudyHomePage> createState() => _StudySpaceHomePageState();

}

class _StudySpaceHomePageState extends State<StudyHomePage> {

  int selectedIndex = 0;

  final List<Widget> pages = const [
    PomodoroPage(),
    TasksPage(),
    FlashcardsPage(),
  ];

  void handleSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 1000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}