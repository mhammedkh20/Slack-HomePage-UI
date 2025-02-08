import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/dragable_listview/animation/provider/animation_effect.dart';

class FlipInY extends AnimationEffect<double> {
  static const double beginValue = pi / 2;
  static const double endValue = 0.0;
  final double? begin;
  final double? end;

  /// An animation that flips the item along the Y-axis.
  FlipInY({super.delay, super.duration, super.curve, this.begin, this.end});

  @override
  Widget build(BuildContext context, Widget child, Animation<double> animation,
      EffectEntry entry, Duration totalDuration) {
    final Animation<double> rotation = buildAnimation(entry, totalDuration,
            begin: begin ?? beginValue, end: endValue)
        .animate(animation);
    return AnimatedBuilder(
      animation: rotation,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform: Matrix4.rotationY(rotation.value),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
