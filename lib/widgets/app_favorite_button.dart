import 'package:flutter/material.dart';

class AppFavoriteButton extends StatelessWidget {
  const AppFavoriteButton({
    super.key,
    required this.selected,
    required this.label,
    required this.onTap,
  });
  final bool selected;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: label,
    isSelected: selected,
    onPressed: onTap,
    icon: const Icon(Icons.favorite_border),
    selectedIcon: const Icon(Icons.favorite),
  );
}
