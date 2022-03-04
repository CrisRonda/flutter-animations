import 'package:animations/src/pages/launcher_page.dart';
import 'package:animations/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => new ThemeChanger(23), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: theme.currentTheme,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LauncherPage());
  }
}
