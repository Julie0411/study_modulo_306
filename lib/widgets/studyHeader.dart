import 'package:flutter/material.dart';

class StudySpaceHeader extends StatelessWidget {
  const StudySpaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 40, color: Colors.deepPurple[400]),
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
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}