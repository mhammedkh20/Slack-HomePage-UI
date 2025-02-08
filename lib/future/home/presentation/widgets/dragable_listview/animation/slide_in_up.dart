import 'package:flutter/cupertino.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/dragable_listview/animation/provider/animation_effect.dart';

class SlideInUp extends AnimationEffect<Offset> {
  static const Offset beginValue = Offset(0, -1);
  static const Offset endValue = Offset(0, 0);
  final Offset? begin;
  final Offset? end;

  /// A sliding animation from the bottom to the top.
  SlideInUp({super.delay, super.duration, super.curve, this.begin, this.end});

  @override
  Widget build(BuildContext context, Widget child, Animation<double> animation,
      EffectEntry entry, Duration totalDuration) {
    final Animation<Offset> position = buildAnimation(entry, totalDuration,
            begin: begin ?? beginValue, end: end ?? endValue)
        .animate(animation);
    return ClipRect(
        clipBehavior: Clip.hardEdge,
        child: SlideTransition(position: position, child: child));
  }
}
