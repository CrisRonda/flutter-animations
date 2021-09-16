import 'package:animations/src/widgets/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Onboarding(
        slides: [
          SvgPicture.asset("assets/svgs/1.svg"),
          SvgPicture.asset("assets/svgs/2.svg"),
          SvgPicture.asset("assets/svgs/3.svg"),
          SvgPicture.asset("assets/svgs/4.svg"),
          SvgPicture.asset("assets/svgs/5.svg"),
        ],
        enableTop: true,
        activeColor: Colors.cyan,
        disableColor: Colors.green,
        sizeActiveBullet: 20,
      ),
    );
  }
}
