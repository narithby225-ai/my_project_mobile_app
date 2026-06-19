import 'package:flutter/material.dart';

class HoverableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HoverableCard({super.key, required this.child, this.onTap});

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? Colors.blue.withOpacity(0.25)
                        : Colors.black.withOpacity(0.08),
                    blurRadius: _isHovered ? 16 : 4,
                    spreadRadius: _isHovered ? 2 : 0,
                    offset: Offset(0, _isHovered ? 6 : 2),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
