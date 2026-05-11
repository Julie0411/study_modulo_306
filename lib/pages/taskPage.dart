import 'package:flutter/material.dart';
import '../widgets/taskCard.dart';

class MyTask {
  String title;
  String priority;
  bool isDone;
  MyTask({required this.title, required this.priority, this.isDone = false});
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController _controller = TextEditingController();
  String _selectedPriority = 'High';

  final List<MyTask> _myTasks = [
    MyTask(title: "test 1", priority: "Low"),
  ];

  final Color violaTema = const Color(0xFF6A5AE0);
  final Color sfondoViolaChiaro = const Color(0xFFF8F7FF);

  Color _coloriPriorita(String p) {
    if (p == 'High') return Colors.red.shade200;
    if (p == 'Medium') return Colors.orange.shade200;
    return Colors.green.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: violaTema.withOpacity(0.1), width: 2),
          ),
          child: Column(
            children: [
              // HEADER: Titolo e Contatore
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tasks", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: violaTema)),
                  Text("${_myTasks.where((t)=>t.isDone).length}/${_myTasks.length} done", style: const TextStyle(color: Colors.grey)),
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
                        fillColor: sfondoViolaChiaro,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          _myTasks.add(MyTask(title: _controller.text, priority: _selectedPriority));
                          _controller.clear();
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: violaTema, borderRadius: BorderRadius.circular(15)),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // SELETTORE PRIORITA' (Dropdown)
              Align(
                alignment: Alignment.centerRight,
                child: DropdownButton<String>(
                  value: _selectedPriority,
                  items: <String>['Low', 'Medium', 'High'].map((String val) {
                    return DropdownMenuItem<String>(value: val, child: Text(val));
                  }).toList(),
                  onChanged: (newVal) => setState(() => _selectedPriority = newVal!),
                ),
              ),

              const Divider(),

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
                    onToggle: () => setState(() => item.isDone = !item.isDone),
                    onDelete: () => setState(() => _myTasks.removeAt(index)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}