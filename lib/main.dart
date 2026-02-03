import 'package:flutter/material.dart';
import 'package:study_modulo_306/pages/homepage.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const StudyHomePage(),
    );
  }
}
