import 'package:flutter/material.dart';

class CustomFadingWidgetState extends StatefulWidget {
  const CustomFadingWidgetState({super.key, required this.child});
  final Widget child;
  @override
  State<CustomFadingWidgetState> createState() =>
      _CustomFadingWidgetStateState();
}

class _CustomFadingWidgetStateState extends State<CustomFadingWidgetState>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    animation = Tween<double>(begin: .2, end: .8).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
