import 'package:flutter/material.dart';
import 'package:study_modulo_306/pages/pomodoro_timer.dart';
import 'header.dart';
import 'navigator.dart';

class StudyHomePage extends StatelessWidget {
  const StudyHomePage({super.key});

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
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StudyHeader(),
                SizedBox(height: 30),
                NavigationCards(),
                SizedBox(height: 30),
                PomodoroTimerCard(),
                SizedBox(height: 1000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}