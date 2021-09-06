import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgess extends StatefulWidget {
  final double percentage;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final double percentageWidth;
  final Gradient? gradient;

  const RadialProgess(
      {required this.percentage,
      this.color = const Color(0xFF3C1EAB),
      this.strokeColor = const Color(0x68515252),
      this.strokeWidth = 5,
      this.percentageWidth = 5,
      this.gradient});

  @override
  _RadialProgessState createState() => _RadialProgessState();
}

class _RadialProgessState extends State<RadialProgess>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double befPercentage = 0.0;

  @override
  void initState() {
    befPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    controller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final percentage = widget.percentage;
    final difPercentage = percentage - befPercentage;
    befPercentage = percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _RadialProgress(
                  // hack to play animation with controller.value
                  (percentage - difPercentage) +
                      difPercentage * controller.value,
                  widget.color,
                  widget.strokeColor,
                  widget.strokeWidth,
                  widget.percentageWidth,
                  widget.gradient),
            ));
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double percentage;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final double percentageWidth;
  final Gradient? gradient;
  
  final Rect rect = new Rect.fromCircle(center: Offset(25, 120), radius: 270);
  _RadialProgress(this.percentage, this.color, this.strokeColor,
      this.strokeWidth, this.percentageWidth, this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    // Circle
    final Paint paint = new Paint()
      ..strokeWidth = this.strokeWidth
      ..color = this.strokeColor
      ..style = PaintingStyle.stroke;
    final Offset center = new Offset(width / 2, height / 2);
    final double radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
    // Arc
    final Paint paintArc = new Paint()
      ..strokeWidth = this.percentageWidth
      ..color = this.color
      ..shader = this.gradient !=null ? gradient!.createShader(rect) : null
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final double arcAngle = 2 * pi * percentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
