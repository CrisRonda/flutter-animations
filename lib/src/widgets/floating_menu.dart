import 'package:animations/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemMenu {
  final Function onPress;
  final IconData icon;

  ItemMenu({required this.onPress, required this.icon});
}

class FloatingMenu extends StatelessWidget {
  final bool show;
  final List<ItemMenu> items;
  final Color bgcolor;
  final Color activeColor;
  final Color inactiveColor;
  FloatingMenu(
      {this.show = true,
      required this.items,
      this.bgcolor = Colors.white,
      this.activeColor = Colors.amber,
      this.inactiveColor = Colors.black45});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: Duration(milliseconds: 544),
      child: ChangeNotifierProvider(
          create: (_) => new _MenuState(),
          child: _Background(
            child:
                _MenuItems(items, appTheme.accentColor, appTheme.primaryColor),
            bgcolor: appTheme.scaffoldBackgroundColor,
          )),
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;
  final Color bgcolor;
  const _Background({required this.child, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: -6)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<ItemMenu> items;
  final Color activeColor;
  final Color inactiveColor;
  const _MenuItems(this.items, this.activeColor, this.inactiveColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          items.length,
          (index) =>
              _MenuItem(index, items[index], activeColor, inactiveColor)),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final int index;
  final ItemMenu item;
  final Color activeColor;
  final Color inactiveColor;
  const _MenuItem(this.index, this.item, this.activeColor, this.inactiveColor);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuState>(context);
    final currentIndex = provider.index;
    return GestureDetector(
      child: Icon(
        item.icon,
        size: currentIndex == index ? 32 : 24,
        color: currentIndex == index ? activeColor : inactiveColor,
      ),
      onTap: () {
        provider.index = index;
        item.onPress();
      },
    );
  }
}

class _MenuState with ChangeNotifier {
  int _index = 0;
  int get index => this._index;
  set index(int newIndex) {
    this._index = newIndex;
    notifyListeners();
  }
}
