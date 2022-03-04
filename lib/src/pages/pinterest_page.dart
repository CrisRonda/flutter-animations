import 'package:animations/src/theme/theme.dart';
import 'package:animations/src/widgets/floating_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _PageState(),
      child: Scaffold(
          body: Stack(
        children: [GridView(), _Menu()],
      )),
    );
  }
}

class _Menu extends StatelessWidget {
  final List<ItemMenu> items = [
    ItemMenu(icon: Icons.add_circle_outline_sharp, onPress: () => print("add")),
    ItemMenu(icon: Icons.search, onPress: () => print("Search")),
    ItemMenu(
        icon: Icons.notification_add, onPress: () => print("Notifications")),
    ItemMenu(
        icon: Icons.supervised_user_circle, onPress: () => print("Supervise"))
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final show = Provider.of<_PageState>(
      context,
    ).show;
    if (width > 500) {
      width -= 300;
    }
    return Positioned(
        bottom: 30,
        child: Container(
            width: width,
            child: Row(children: [
              Spacer(),
              FloatingMenu(
                show: show,
                items: items,
              ),
              Spacer(),
            ])));
  }
}

class GridView extends StatefulWidget {
  @override
  State<GridView> createState() => _GridViewState();
}

class _GridViewState extends State<GridView> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double befScroll = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final provider = Provider.of<_PageState>(context, listen: false);
      // print("Controller ${controller.offset}");
      if (controller.offset > befScroll) {
        provider.show = false;
      } else {
        provider.show = true;
      }
      befScroll = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return new StaggeredGridView.countBuilder(
      controller: controller,
      itemCount: items.length,
      crossAxisCount: count,
      itemBuilder: (BuildContext context, int index) => TileItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 12.0,
    );
  }
}

class TileItem extends StatelessWidget {
  final int index;
  const TileItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _PageState with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool newShow) {
    this._show = newShow;
    notifyListeners();
  }
}
