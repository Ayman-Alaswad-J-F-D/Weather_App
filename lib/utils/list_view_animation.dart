import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimation extends StatelessWidget {
  const ListViewAnimation({
    Key? key,
    required this.index,
    required this.child,
  }) : super(key: key);

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutBack,
        // horizontalOffset: 30,
        // verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutBack,
          flipAxis: FlipAxis.y,
          child: child,
        ),
      ),
    );
  }
}
