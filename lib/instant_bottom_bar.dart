library instant_bottom_bar;

import 'package:flutter/material.dart';

const Color defaultSelectedColor = Colors.white;
const Color defaultUnselectedColor = Colors.white60;
const Color defaultBackgroundColor = Colors.blue;

class FixedBottomNavigationBar extends _BottomNavigationBar {
  const FixedBottomNavigationBar(
      {Key? key,
      required List<BottomNavigationTabData> tabs,
      Color selectedItColor = defaultSelectedColor,
      Color unselectedItColor = defaultUnselectedColor,
      Color backgroundColor = defaultBackgroundColor,
      AppBar? appBar,
      FloatingActionButton? floatingActionButton})
      : super(
            key: key,
            tabs: tabs,
            type: BottomNavigationBarType.fixed,
            selectedItColor: selectedItColor,
            unselectedItColor: unselectedItColor,
            backgroundColor: backgroundColor,
            appBar: appBar,
            floatingActionButton: floatingActionButton);
}

class ShiftingBottomNavigationBar extends _BottomNavigationBar {
  const ShiftingBottomNavigationBar(
      {Key? key,
      required List<BottomNavigationTabData> tabs,
      Color selectedItColor = defaultSelectedColor,
      Color unselectedItColor = defaultUnselectedColor,
      Color backgroundColor = defaultBackgroundColor,
      AppBar? appBar,
      FloatingActionButton? floatingActionButton})
      : super(
            key: key,
            tabs: tabs,
            type: BottomNavigationBarType.shifting,
            selectedItColor: selectedItColor,
            unselectedItColor: unselectedItColor,
            backgroundColor: backgroundColor,
            appBar: appBar,
            floatingActionButton: floatingActionButton);
}

class _BottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationTabData> tabs;
  final BottomNavigationBarType type;
  final Color selectedItColor;
  final Color unselectedItColor;
  final Color backgroundColor;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;
  const _BottomNavigationBar(
      {Key? key,
      required this.tabs,
      required this.type,
      required this.selectedItColor,
      required this.unselectedItColor,
      required this.backgroundColor,
      this.appBar,
      this.floatingActionButton})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = widget.tabs.map((e) => e.widget).toList();
    final _kBottomNavBarItems = widget.tabs
        .map((e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
            backgroundColor: widget.backgroundColor))
        .toList();
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: widget.backgroundColor,
      selectedItemColor: widget.selectedItColor,
      unselectedItemColor: widget.unselectedItColor,
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: widget.type,
      onTap: (index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
        appBar: widget.appBar,
        floatingActionButton: widget.floatingActionButton,
        body: _kTabPages[_currentTabIndex],
        bottomNavigationBar: bottomNavBar);
  }
}

class BottomNavigationTabData {
  final IconData icon;
  final String label;
  final Widget widget;
  const BottomNavigationTabData(
      {required this.icon, required this.label, required this.widget});
}
