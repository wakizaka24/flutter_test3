import 'package:flutter/material.dart';

class HighlightAbleButton extends StatelessWidget {
  const HighlightAbleButton({super.key,
    required this.title,
    this.fontSize,
    this.index,
    required this.isHighlighted,
    required this.onTapDown,
    required this.onTap,
    required this.onTapCancel,
  });

  final String title;
  final double? fontSize;
  final int? index;
  final bool isHighlighted;
  final void Function(int?) onTapDown;
  final void Function(int?) onTap;
  final void Function(int?) onTapCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(index),
      onTap: () => onTap(index),
      onTapCancel: () => onTapCancel(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isHighlighted
              ? theme.colorScheme.secondaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: isHighlighted
                  ? theme.colorScheme.onSecondaryContainer
                  : theme.colorScheme.onSurfaceVariant,
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}