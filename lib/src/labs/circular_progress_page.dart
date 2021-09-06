import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  // Animations
  late AnimationController controller;
  double currentPercentage = 0.0;
  double nextPercentage = 0.0;
  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    controller.addListener(() {
      // print('valor controller: $currentPercentage $percentage ${controller.value}');
      setState(() {
        currentPercentage =
            lerpDouble(currentPercentage, nextPercentage, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentPercentage = nextPercentage;
          nextPercentage += .10;
          if (nextPercentage >= 1.00) {
            nextPercentage = 0;
            currentPercentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(currentPercentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double percentage;

  _RadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    // Circle
    final Paint paint = new Paint()
      ..strokeWidth = 5
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke;
    final Offset center = new Offset(width / 2, height / 2);
    final double radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
    // Arc
    final Paint paintArc = new Paint()
      ..strokeWidth = 8
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    final double arcAngle = 2 * pi * percentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
