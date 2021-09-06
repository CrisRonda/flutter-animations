import 'package:flutter/material.dart';

class SquareAnimatePage extends StatelessWidget {
  const SquareAnimatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _SquareAnimate()),
    );
  }
}

class _SquareAnimate extends StatefulWidget {
  @override
  __SquareAnimateState createState() => __SquareAnimateState();
}

CurvedAnimation generateCurve(
    Animation<double> controller, double begin, double end) {
  return CurvedAnimation(
      parent: controller, curve: Interval(begin, end, curve: Curves.bounceOut));
}

class __SquareAnimateState extends State<_SquareAnimate>
    with SingleTickerProviderStateMixin {
  final double distance = 160.0;
  final double slideTime = 0.25;
  late AnimationController controller;
  late Animation<double> xRight;
  late Animation<double> xLeft;
  late Animation<double> yUp;
  late Animation<double> yDown;
  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    final CurvedAnimation positionXRightCurve =
        generateCurve(controller, 0.0, slideTime);
    final CurvedAnimation positionYUpCurve =
        generateCurve(controller, slideTime, slideTime * 2);
    final CurvedAnimation positionXLeftCurve =
        generateCurve(controller, slideTime * 2, slideTime * 3);
    final CurvedAnimation positionYDownCurve =
        generateCurve(controller, slideTime * 3, slideTime * 4);
    xRight = Tween(begin: 0.0, end: distance).animate(positionXRightCurve);
    yUp = Tween(begin: 0.0, end: -distance).animate(positionYUpCurve);
    xLeft = Tween(begin: 0.0, end: distance).animate(positionXLeftCurve);
    yDown = Tween(begin: 0.0, end: -distance).animate(positionYDownCurve);

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
      child: _Square(),
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(xRight.value - xLeft.value, yUp.value - yDown.value),
          child: child,
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
      width: 60,
      height: 60,
      color: Colors.greenAccent,
    );
  }
}
