import 'package:flutter/material.dart';
import '../widgets/taskCard.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const taskCard(title: 'Tasks');
  }
}