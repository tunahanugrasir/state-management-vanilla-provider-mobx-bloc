import 'package:flutter/material.dart';

import 'on_board_models.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _controller.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _controller,
    );
  }
}
