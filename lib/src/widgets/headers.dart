import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xFF42DDF2),
    );
  }
}

class RoundedHeader extends StatelessWidget {
  const RoundedHeader({Key? key}) : super(key: key);
  final rounded = 50.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xFF528528),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(rounded),
              bottomRight: Radius.circular(rounded))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class TriangularHeader extends StatelessWidget {
  const TriangularHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class CenterTriangularHeader extends StatelessWidget {
  const CenterTriangularHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CenterTriangularHeaderPainter(),
      ),
    );
  }
}

class CircularHeader extends StatelessWidget {
  const CircularHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CircularHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = new Paint();
    // properties
    paint.color = Color(0xFF682885);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, height * 0.4);
    path.lineTo(width, height * 0.3);
    path.lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = new Paint();
    // properties
    paint.color = Color(0xFF6AA5FC);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.moveTo(0, 0);
    // path.lineTo(0, height) ;
    path.lineTo(width, 0);
    path.lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _CenterTriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final y = 0.3 * height;
    final paint = new Paint();
    // properties
    paint.color = Color(0xFF994F23);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, y * .7);
    path.lineTo(width / 2, y);
    path.lineTo(width, y * .7);
    path.lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _CircularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final y = 0.2 * height;
    final paint = new Paint();
    // properties
    paint.color = Color(0xFF17FB63);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, y);
    // down
    path.quadraticBezierTo(width / 2, height * 0.4, width, y);
    // up
    // path.quadraticBezierTo(width / 2, height * 0.05, width, y);
    path.lineTo(width, y);
    path.lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveHeader extends StatelessWidget {
  const WaveHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final y = 0.25 * height;
    final upY = .8 * height;
    final curve = 1.1;
    final paint = new Paint();
    // properties
    paint.color = Color(0xFFFF0707);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 22.0;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, y);
    path.quadraticBezierTo(width * .25, y * curve, width * 0.5, y);
    path.quadraticBezierTo(width * 0.75, y / curve, width, y);
    path.lineTo(width, y);
    path.lineTo(width, 0);

    // bottom wave
    path.moveTo(0, height);
    path.lineTo(0, upY);
    path.quadraticBezierTo(width * .25, upY / curve, width * 0.5, upY);
    path.quadraticBezierTo(width * 0.75, upY * curve, width, upY);
    path.lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GradientWaveHeader extends StatelessWidget {
  const GradientWaveHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _GradientWaveHeaderPainter(),
      ),
    );
  }
}

class _GradientWaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final y = 0.25 * height;
    final upY = .8 * height;
    final curve = 1.1;
    final Gradient gradient = new LinearGradient(colors: <Color>[
      Color(0xFFFF9D00),
      Color(0xddFF9D00),
      Color(0x77FF9D00),
    ], stops: [
      0.1,
      0.3,
      1
    ]);
    final rect =
        new Rect.fromCircle(center: Offset(width * .5, 0), radius: 180);
    final paint = new Paint()..shader = gradient.createShader(rect);
    // properties
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 22.0;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, y);
    path.quadraticBezierTo(width * .25, y * curve, width * 0.5, y);
    path.quadraticBezierTo(width * 0.75, y / curve, width, y);
    path.lineTo(width, y);
    path.lineTo(width, 0);

    // bottom wave
    path.moveTo(0, height);
    path.lineTo(0, upY);
    path.quadraticBezierTo(width * .25, upY / curve, width * 0.5, upY);
    path.quadraticBezierTo(width * 0.75, upY * curve, width, upY);
    path.lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryColorBg;
  final Color secondColorBg;

  const IconHeader(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.primaryColorBg = const Color(0xff526bf6),
      this.secondColorBg = const Color(0xff67ACF2)});

  @override
  Widget build(BuildContext context) {
    final Color whiteWithOpacity = Colors.white.withOpacity(0.7);
    bool isLarge = false;
    final size = MediaQuery.of(context).size;
    if (size.height > 500) {
      isLarge = true;
    }
    final double rate = isLarge ? 1 : .5;
    return Stack(
      children: [
        _IconHeaderBackground(color1: primaryColorBg, color2: secondColorBg),
        Positioned(
          top: -40,
          left: -80,
          child: FaIcon(
            this.icon,
            color: whiteWithOpacity.withOpacity(0.3),
            size: 250 * rate,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 100 * rate,
              width: double.infinity,
            ),
            Text(
              this.title,
              style: TextStyle(fontSize: 32 * rate, color: whiteWithOpacity),
            ),
            SizedBox(height: 20 * rate),
            Text(
              this.subtitle,
              style: TextStyle(
                  fontSize: 32 * rate,
                  color: whiteWithOpacity,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20 * rate),
            FaIcon(
              this.icon,
              color: whiteWithOpacity.withOpacity(1),
              size: 72 * rate,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = false;
    final size = MediaQuery.of(context).size;
    if (size.height > 500) {
      isLarge = true;
    }
    return Container(
      width: double.infinity,
      height: isLarge ? 300 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isLarge ? 100 : 50),
        ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [this.color1, this.color2]),
      ),
    );
  }
}
