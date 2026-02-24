import 'package:flutter/material.dart';

class NavigationCards extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const NavigationCards({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _NavigationCard(
          icon: Icons.timer,
          label: 'Pomodoro',
          isSelected: selectedIndex == 0,
          onTap: () => onSelected(0),
        ),
        _NavigationCard(
          icon: Icons.check_box_outlined,
          label: 'Tasks',
          isSelected: selectedIndex == 1,
          onTap: () => onSelected(1),
        ),
        _NavigationCard(
          icon: Icons.lightbulb_outline,
          label: 'Flashcards',
          isSelected: selectedIndex == 2,
          onTap: () => onSelected(2),
        ),
      ],
    );
  }
}

class _NavigationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
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
                size: 28,
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
      ),
    );
  }
}