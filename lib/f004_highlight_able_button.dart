import 'package:flutter/material.dart';

class HighlightAbleButton extends StatefulWidget {
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
  State<HighlightAbleButton> createState() => _HighlightAbleButton();
}

class _HighlightAbleButton extends State<HighlightAbleButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (TapDownDetails details) => widget.onTapDown(widget.index),
      onTap: () => widget.onTap(widget.index),
      onTapCancel: () => widget.onTapCancel(widget.index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: widget.isHighlighted
              ? theme.colorScheme.secondaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: widget.isHighlighted
                  ? theme.colorScheme.onSecondaryContainer
                  : theme.colorScheme.onSurfaceVariant,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}