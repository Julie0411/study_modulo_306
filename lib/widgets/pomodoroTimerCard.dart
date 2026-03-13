import 'package:flutter/material.dart';

class PomodoroTimerCard extends StatelessWidget {
  const PomodoroTimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Focus Time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '25:00',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              letterSpacing: 5,
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: 1,
            backgroundColor: Colors.deepPurple[100],
            valueColor:
            AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            minHeight: 12,
            borderRadius: BorderRadius.circular(20),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => debugPrint('Start timer!'),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                onPressed: () => debugPrint('Reset timer!'),
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple.shade400,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                      color: Colors.deepPurple.shade400, width: 3),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Sessions completed: 0',
            style: TextStyle(
              fontSize: 15,
              color: Colors.deepPurple.shade600,
            ),
          ),
        ],
      ),
    );
  }
}