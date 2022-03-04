import 'package:animations/src/theme/theme.dart';
import 'package:animations/src/widgets/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        children: [
          Expanded(child: CustomOnboarding()),
          Expanded(child: CustomOnboarding()),
        ],
      ),
    );
  }
}

class CustomOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final currentTheme = appTheme.currentTheme;
    final isDark = appTheme.darkTheme;
    final isCustom = appTheme.customTheme;
    final activeColor = isDark ? currentTheme.primaryColor : Colors.pink;
    final disableColor = isDark ? currentTheme.cardColor : Colors.teal;
    return Onboarding(
      slides: [
        SvgPicture.asset("assets/svgs/1.svg"),
        SvgPicture.asset("assets/svgs/2.svg"),
        SvgPicture.asset("assets/svgs/3.svg"),
        SvgPicture.asset("assets/svgs/4.svg"),
        SvgPicture.asset("assets/svgs/5.svg"),
      ],
      enableTop: true,
      activeColor: isCustom ? Colors.amber : activeColor,
      disableColor: isCustom ? Colors.amber.withOpacity(0.4) : disableColor,
      sizeActiveBullet: 20,
    );
  }
}
