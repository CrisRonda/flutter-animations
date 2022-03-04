import 'package:animations/src/pages/slide_show_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
