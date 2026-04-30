import 'package:flutter/material.dart';
import '../pages/studyHomePage.dart';

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudySpace',
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
