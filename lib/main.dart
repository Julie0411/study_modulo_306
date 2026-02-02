import 'package:flutter/material.dart';

void main() {
  runApp(const StudySpaceApp());
}

class StudySpaceApp extends StatelessWidget {
  const StudySpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudySpace',
      theme: ThemeData(
        // Tema principale dell'app
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const StudySpaceHomePage(),
    );
  }
}

class StudySpaceHomePage extends StatelessWidget {
  const StudySpaceHomePage({super.key});

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
                StudySpaceHeader(),
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

class NavigationCards extends StatelessWidget {
  const NavigationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _NavigationCard(
          icon: Icons.timer,
          label: 'Pomodoro',
          isSelected: true,
        ),
        _NavigationCard(
          icon: Icons.check_box_outlined,
          label: 'Tasks',
        ),
        _NavigationCard(
          icon: Icons.lightbulb_outline,
          label: 'Flashcards',
        ),
      ],
    );
  }
}

class _NavigationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _NavigationCard({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          border: isSelected
              ? Border.all(color: Colors.deepPurple.shade200, width: 2)
              : null,
        ),
        child: Column(
          children: [
            Icon(
                icon,
                color: isSelected ? Colors.deepPurple : Colors.grey[700],
                size: 28
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.deepPurple : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PomodoroTimerCard extends StatelessWidget {
  const PomodoroTimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
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
          const SizedBox(height: 25),

          const Text(
            '25:00',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 25),

          LinearProgressIndicator(
            value: 0.8,
            backgroundColor: Colors.deepPurple[100],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple.shade300),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint('Start Pomodoro!');
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade300,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                onPressed: () {
                  debugPrint('Reset Pomodoro!');
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple.shade400,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.deepPurple.shade200, width: 2),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Sessions completed: 0',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderCard extends StatelessWidget {
  final String title;

  const PlaceholderCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 150, // Altezza fissa per l'esempio
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple[700],
          ),
        ),
      ),
    );
  }
}