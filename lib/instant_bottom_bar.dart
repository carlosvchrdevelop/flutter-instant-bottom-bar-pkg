library instant_bottom_bar;

import 'package:flutter/material.dart';

class FixedBottomNavigationBar extends _BottomNavigationBar {
  const FixedBottomNavigationBar(
      {Key? key,
      required List<BottomNavigationTabData> tabs,
      Color? color,
      Color? backgroundColor})
      : super(
            key: key,
            tabs: tabs,
            type: BottomNavigationBarType.fixed,
            color: color,
            backgroundColor: backgroundColor);
}

class ShiftingBottomNavigationBar extends _BottomNavigationBar {
  const ShiftingBottomNavigationBar(
      {Key? key,
      required List<BottomNavigationTabData> tabs,
      Color? color,
      Color? backgroundColor})
      : super(
            key: key,
            tabs: tabs,
            type: BottomNavigationBarType.shifting,
            color: color,
            backgroundColor: backgroundColor);
}

class _BottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationTabData> tabs;
  final BottomNavigationBarType type;
  final Color? color;
  final Color? backgroundColor;
  const _BottomNavigationBar(
      {Key? key,
      required this.tabs,
      required this.type,
      this.color = Colors.black,
      this.backgroundColor = Colors.white})
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
        .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
        .toList();
    final bottomNavBar = BottomNavigationBar(
      fixedColor: widget.color,
      backgroundColor: widget.backgroundColor,
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
        body: _kTabPages[_currentTabIndex], bottomNavigationBar: bottomNavBar);
  }
}

class BottomNavigationTabData {
  final IconData icon;
  final String label;
  final Widget widget;
  const BottomNavigationTabData(
      {required this.icon, required this.label, required this.widget});
}
