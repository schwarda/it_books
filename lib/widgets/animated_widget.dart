import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:http_bloc/theme/app_colors.dart';

class SpinningContainer extends AnimatedWidget {
  final Widget? child;

  const SpinningContainer({
    super.key,
    required AnimationController controller,
    required this.child,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * math.pi,
      child: child,
      // Image.asset(
      //   'assets/img/torus.png',
      //   width: 200,
      //   height: 200,
      // ),
    );
  }
}
