import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(),
      ),
    );
  }
}

class GridView extends StatelessWidget {
  final List items = List.generate(200, (index) => index);
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      itemCount: items.length,
      crossAxisCount: 4,
      itemBuilder: (BuildContext context, int index) => TileItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2,index.isEven ? index%3==0? 2:3:4),
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
