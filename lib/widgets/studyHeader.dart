import 'package:flutter/material.dart';

class StudyHeader extends StatelessWidget {
  const StudyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.school,
          size: 70,
          color: Colors.deepPurple[400],
        ),
        const SizedBox(width: 10),
        Text(
          'StudySpace',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[700],
          ),
        ),
      ],
    );
  }
}