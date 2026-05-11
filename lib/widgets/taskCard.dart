import 'package:flutter/material.dart';

Widget taskCard({
  required String title,
  required String priority,
  required bool isDone,
  required Color accentColor,
  required VoidCallback onToggle,
  required VoidCallback onDelete,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
      ],
    ),
    child: Row(
      children: [
        Container(width: 6, height: 60, decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)))),
        const SizedBox(width: 10),


        Checkbox(
          value: isDone,
          onChanged: (val) => onToggle(),
          activeColor: const Color(0xFF6A5AE0),
        ),
        // Il testo (si sbarra se è fatto)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: isDone ? TextDecoration.lineThrough : null, color: isDone ? Colors.grey : Colors.black87)),
              Text(priority, style: TextStyle(fontSize: 12, color: accentColor)),
            ],
          ),
        ),
        // Il cestino per eliminare
        IconButton(icon: const Icon(Icons.delete_outline, color: Colors.redAccent), onPressed: onDelete),
      ],
    ),
  );
}