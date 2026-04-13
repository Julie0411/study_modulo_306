import 'dart:async';
import 'package:flutter/material.dart';

class PomodoroTimerCard extends StatefulWidget {
  const PomodoroTimerCard({super.key});

  @override
  State<PomodoroTimerCard> createState() => _PomodoroTimerCardState();

}

class _PomodoroTimerCardState extends State<PomodoroTimerCard> {

  Timer? _timer;

  int _remainingSeconds = 5;
  int _totalSeconds = 5;

  int _sessionsCompleted = 0;

  bool _isRunning = false;

  void startTimer() {
    if (_isRunning) return;

    _isRunning = true;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            timer.cancel();
            _isRunning = false;
            _sessionsCompleted++;
          }
        });
      },
    );
  }

  void resetTimer() {
    _timer?.cancel();

    setState(() {
      _remainingSeconds = _totalSeconds;
      _isRunning = false;
    });
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

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
                  color: Colors.deepPurple[400],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            formatTime(_remainingSeconds),
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[400],
              letterSpacing: 5,
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: (_totalSeconds - _remainingSeconds) / _totalSeconds,
            backgroundColor: Colors.deepPurple[100],
            valueColor:
            AlwaysStoppedAnimation<Color>(Colors.deepPurple.shade400),
            minHeight: 12,
            borderRadius: BorderRadius.circular(20),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: startTimer,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
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
              ElevatedButton.icon(
                onPressed: resetTimer,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
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
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Sessions completed: $_sessionsCompleted',
            style: TextStyle(
              fontSize: 15,
              color: Colors.deepPurple.shade400,
            ),
          ),
        ],
      ),
    );
  }

}