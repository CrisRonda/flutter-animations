import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _SquareAnimated(),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({
    Key? key,
  }) : super(key: key);

  @override
  __SquareAnimatedState createState() => __SquareAnimatedState();
}

class __SquareAnimatedState extends State<_SquareAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> positionX;
  late Animation<double> scale;
  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));
    final CurvedAnimation rotationCurve =
        CurvedAnimation(parent: controller, curve: Curves.slowMiddle);

    final CurvedAnimation opacityCurve = CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut));

    final CurvedAnimation opacityOutCurve = CurvedAnimation(
        parent: controller, curve: Interval(0.5, 1, curve: Curves.easeInOut));

    final CurvedAnimation positionXCurve = CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1, curve: Curves.easeOut));
    final CurvedAnimation scaleCurve = CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1, curve: Curves.easeOut));

    rotation = Tween(begin: 0.0, end: 2 * pi).animate(rotationCurve);
    opacity = Tween(begin: 0.0, end: 1.0).animate(opacityCurve);
    opacityOut = Tween(begin: 1.0, end: 0.0).animate(opacityOutCurve);

    positionX = Tween(begin: 0.0, end: 345.5).animate(positionXCurve);
    scale = Tween(begin: 0.0, end: 2.5).animate(scaleCurve);
    // controller.addListener(() {
    //   if (controller.status == AnimationStatus.completed) {
    //     controller.reverse();
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.repeat();
    return AnimatedBuilder(
      animation: controller,
      child: _Square(), // render one time
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(positionX.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                child: Transform.scale(scale: scale.value, child: child),
                opacity: opacity.value != 1 ? opacity.value : opacityOut.value,
              )),
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: Colors.blueGrey,
    );
  }
}
