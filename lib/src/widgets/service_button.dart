import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceButton extends StatelessWidget {
  final IconData icon;
  final Color colorPrimaryBg;
  final Color colorSecondaryBg;
  final Color? colorText;
  final Function()? onPressed;

  const ServiceButton(
      {Key? key,
      required this.icon,
      this.colorPrimaryBg = Colors.orange,
      this.colorSecondaryBg = Colors.orangeAccent,
      this.colorText,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Stack(children: [
        _Background(
          icon: this.icon,
          colorPrimaryBg: colorPrimaryBg,
          colorSecondaryBg: colorSecondaryBg,
        ),
      ]),
    );
  }
}

class _Background extends StatelessWidget {
  final IconData icon;
  final Color colorPrimaryBg;
  final Color colorSecondaryBg;
  final Color colorText;
  const _Background({
    Key? key,
    required this.icon,
    required this.colorPrimaryBg,
    required this.colorSecondaryBg,
    this.colorText = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(children: [
          Positioned(
            top: -10,
            right: -30,
            child: FaIcon(
              this.icon,
              size: 150,
              color: Colors.white.withOpacity(.3),
            ),
          ),
          ContentButton(icon: this.icon)
        ]),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 15,
              offset: Offset(4, 6))
        ],
        gradient: LinearGradient(colors: [
          this.colorPrimaryBg,
          this.colorSecondaryBg,
        ]),
      ),
    );
  }
}

class ContentButton extends StatelessWidget {
  final IconData icon;

  const ContentButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Row(children: [
        SizedBox(
          width: 24,
        ),
        FaIcon(
          this.icon,
          color: Colors.white,
          size: 60,
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Text(
            'Motor Accident',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          width: 24,
        ),
      ]),
    );
  }
}
