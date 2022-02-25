import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _MainScroll(),
        Positioned(bottom: 0, right: 0, child: _ButtonNewList())
      ]),
      // body: _ListViewWithSliver(),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        alignment: Alignment.center,
        width: size.width * 0.9,
        child: Text(
          "Create New List",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   backgroundColor: Colors.red,
        //   title: Text("Holiiiii"),
        //   floating: true,
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                maxHeight: 200,
                minHeight: 170,
                child: Container(color: Colors.white, child: _Title()))),
        SliverList(
            delegate:
                SliverChildListDelegate([...items, SizedBox(height: 100)])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight > minExtent ? maxHeight : minExtent;

  @override
  double get minExtent => minHeight < maxHeight ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'Title',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 50,
                fontWeight: FontWeight.w600),
          ),
          Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: 150,
                    height: 6,
                    color: Colors.amber.withOpacity(.3).withAlpha(90),
                  )),
              Container(
                child: Text(
                  "List",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 50,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ListViewWithSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    ];
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        });
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  const _ListItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      width: 100,
      alignment: Alignment.centerLeft,
      child: Text(
        this.title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
