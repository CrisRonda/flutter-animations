import 'package:animations/src/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:animations/src/routes/routes.dart';
import 'package:animations/src/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Launcher Page - XL'),
        backgroundColor: Colors.deepPurple,
      ),
      // body: _ListPages(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _ListPages(),
            decoration: BoxDecoration(),
          ),
          Container(
            width: 3,
            height: double.infinity,
            color: appBarTheme.currentTheme.dividerColor,
          ),
          Expanded(child: layoutModel.currentPage),
        ],
      ),
      drawer: _Drawer(),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final switchColor = appTheme.currentTheme.splashColor;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: switchColor,
                child: Text(
                  "CR",
                  style: TextStyle(
                      fontSize: 50, color: appTheme.currentTheme.primaryColor),
                ),
              ),
            ),
            Expanded(child: _ListPages()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.amber,
              ),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: switchColor,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  }),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.amber,
              ),
              title: Text('Custom theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: switchColor,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class _ListPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final iconColor = appTheme.textTheme.bodyText1!.color;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: iconColor,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: iconColor,
        ),
        title:
            Text(pageRoutes[index].title, style: TextStyle(color: iconColor)),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: iconColor,
        ),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[index].page;
        },
      ),
    );
  }
}
