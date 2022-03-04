import 'package:animations/src/models/layout_model.dart';
import 'package:animations/src/pages/launcher_page.dart';
import 'package:animations/src/pages/launcher_tablet_page.dart';
import 'package:animations/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => new ThemeChanger(23)),
      ChangeNotifierProvider(create: (_) => new LayoutModel()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: theme.currentTheme,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          }

          return LauncherPage();
          // return orientation == Orientation.portrait ? LauncherPage() : LauncherPageLandscape();
        }));
  }
}
