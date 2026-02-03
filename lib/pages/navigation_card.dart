import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const NavigationCard({
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