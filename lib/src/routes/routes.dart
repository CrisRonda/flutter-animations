import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animations/src/challenges/square_animate_page.dart';
import 'package:animations/src/pages/animation_page.dart';
import 'package:animations/src/pages/circular_graph_pages.dart';
import 'package:animations/src/pages/emergency_page.dart';
import 'package:animations/src/pages/headers_pages.dart';
import 'package:animations/src/pages/pinterest_page.dart';
import 'package:animations/src/pages/slide_show_page.dart';
import 'package:animations/src/pages/sliver_page.dart';

class _Route {
  final String title;
  final Widget page;
  final IconData icon;

  _Route({required this.title, required this.page, required this.icon});
}

final pageRoutes = <_Route>[
  _Route(
      title: "Slideshow",
      page: SlideShowPage(),
      icon: FontAwesomeIcons.slideshare),
  _Route(
      title: "Emergency",
      page: EmergencyPage(),
      icon: FontAwesomeIcons.ambulance),
  _Route(title: "Headers", page: HeadersPage(), icon: FontAwesomeIcons.heading),
  _Route(
      title: "Square Animation",
      page: SquareAnimatePage(),
      icon: FontAwesomeIcons.square),
  _Route(
      title: "More Animation",
      page: AnimationPage(),
      icon: FontAwesomeIcons.wizardsOfTheCoast),
  _Route(
      title: "Circular Animation",
      page: CircularGraphPage(),
      icon: FontAwesomeIcons.circle),
  _Route(
      title: "Pinterest",
      page: PinterestPage(),
      icon: FontAwesomeIcons.pinterest),
  _Route(title: "Slivers", page: SliverPage(), icon: FontAwesomeIcons.mobile),
];
