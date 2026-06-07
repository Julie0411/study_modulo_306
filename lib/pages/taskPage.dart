import 'package:flutter/material.dart';
import '../widgets/taskCard.dart';

class MyTask {
  String title;
  String priority;
  bool isDone;

  MyTask({
    required this.title,
    required this.priority,
    this.isDone = false,
  });
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController _controller = TextEditingController();
  String _selectedPriority = 'Low';

  final List<MyTask> _myTasks = [];

  Color _coloriPriorita(String p) {
    if (p == 'High') return Colors.red.shade200;
    if (p == 'Medium') return Colors.orange.shade200;
    return Colors.green.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tasks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[400],
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "${_myTasks.where((t) => t.isDone).length}/${_myTasks.length} done",
                  style: TextStyle(
                    color: Colors.deepPurple.shade400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Cosa devi studiare?",
                      filled: true,
                      fillColor: Colors.deepPurple.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepPurple.shade100,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepPurple.shade400,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        _myTasks.add(
                          MyTask(
                            title: _controller.text,
                            priority: _selectedPriority,
                          ),
                        );
                        _controller.clear();
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: _selectedPriority,
                  underline: const SizedBox(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.deepPurple[400],
                  ),
                  items: <String>['Low', 'Medium', 'High'].map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      _selectedPriority = newVal!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.deepPurple.withOpacity(0.2),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _myTasks.length,
              itemBuilder: (context, index) {
                final item = _myTasks[index];
                return taskCard(
                  title: item.title,
                  priority: item.priority,
                  isDone: item.isDone,
                  accentColor: _coloriPriorita(item.priority),
                  onToggle: () {
                    setState(() {
                      item.isDone = !item.isDone;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      _myTasks.removeAt(index);
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}