import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatelessWidget {
  final List<Widget> slides;
  final bool enableTop;
  final Color activeColor;
  final Color disableColor;
  final double sizeActiveBullet;
  final double sizeDisabledBullet;
  const Onboarding(
      {this.slides = const [],
      this.enableTop = false,
      this.activeColor = Colors.amber,
      this.disableColor = Colors.grey,
      this.sizeActiveBullet = 15.0,
      this.sizeDisabledBullet = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _OnboardingModel(),
        child: SafeArea(
          child: Center(child: Builder(
            builder: (context) {
              final provider = Provider.of<_OnboardingModel>(context);
              provider.activeColor = this.activeColor;
              provider.disableColor = this.disableColor;
              provider.sizeActiveBullet = this.sizeActiveBullet;
              provider.sizeDisabledBullet = this.sizeDisabledBullet;
              return _Structure(enableTop: enableTop, slides: slides);
            },
          )),
        ));
  }
}

class _Structure extends StatelessWidget {
  const _Structure({
    Key? key,
    required this.enableTop,
    required this.slides,
  }) : super(key: key);

  final bool enableTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (enableTop) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!enableTop) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalItems;
  const _Dots(this.totalItems);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            this.totalItems,
            (index) => _Dot(
                  index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<_OnboardingModel>(context).currentPage;
    final provider = Provider.of<_OnboardingModel>(context);
    final isActive =
        pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5;
    final size =
        isActive ? provider.sizeActiveBullet : provider.sizeDisabledBullet;
    return AnimatedContainer(
      duration: Duration(milliseconds: 228),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isActive) ? provider.activeColor : provider.disableColor,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_OnboardingModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(
    this.slide,
  );
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: this.slide,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _OnboardingModel with ChangeNotifier {
  double _currentPage = 0;

  Color _activeColor = Colors.amber;
  Color _disableColor = Colors.grey;

  double _sizeActiveBullet = 15.0;
  double _sizeDisabledBullet = 12.0;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color _color) {
    this._activeColor = _color;
  }

  Color get disableColor => this._disableColor;
  set disableColor(Color _color) {
    this._disableColor = _color;
  }

  double get sizeActiveBullet => this._sizeActiveBullet;
  set sizeActiveBullet(double size) {
    this._sizeActiveBullet = size;
  }

  double get sizeDisabledBullet => this._sizeDisabledBullet;
  set sizeDisabledBullet(double size) {
    this._sizeDisabledBullet = size;
  }
}
