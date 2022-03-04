import 'package:animate_do/animate_do.dart';
import 'package:animations/src/theme/theme.dart';
import 'package:animations/src/widgets/headers.dart';
import 'package:animations/src/widgets/service_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ServiceButtonProps {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ServiceButtonProps(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context);
    final isDarkMode = currentTheme.darkTheme;
    final items = <ServiceButtonProps>[
      new ServiceButtonProps(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ServiceButtonProps(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ServiceButtonProps(FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
      new ServiceButtonProps(FontAwesomeIcons.biking, 'Awards',
          Color(0xff317183), Color(0xff46997D)),
      new ServiceButtonProps(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ServiceButtonProps(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ServiceButtonProps(FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
      new ServiceButtonProps(FontAwesomeIcons.biking, 'Awards',
          Color(0xff317183), Color(0xff46997D)),
      new ServiceButtonProps(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ServiceButtonProps(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ServiceButtonProps(FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
      new ServiceButtonProps(FontAwesomeIcons.biking, 'Awards',
          Color(0xff317183), Color(0xff46997D)),
    ];

    List itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 500),
              child: ServiceButton(
                icon: item.icon,
                colorPrimaryBg: item.color1,
                colorSecondaryBg: item.color2,
                onPressed: () {
                  print(item.texto);
                },
              ),
            ))
        .toList();
    return Scaffold(
        body: Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 250),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 32),
            ...itemMap,
          ],
        ),
      ),
      PageHeader()
    ]));
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context);
    final isDarkMode = currentTheme.darkTheme;

    return Stack(children: [
      IconHeader(
        icon: FontAwesomeIcons.plusCircle,
        title: "Haz solicitado",
        subtitle: "Asistencia medica",
        primaryColorBg: isDarkMode ? Colors.black : Colors.blueGrey,
        secondColorBg: isDarkMode ? Colors.amber : Colors.grey,
      ),
      Positioned(
          top: 40,
          right: -10,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ))
    ]);
  }
}
