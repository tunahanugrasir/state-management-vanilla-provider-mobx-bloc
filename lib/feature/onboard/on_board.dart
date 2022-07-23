import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanilla_and_provider/feature/onboard/on_board_models.dart';
import 'package:vanilla_and_provider/feature/onboard/tab_indicator.dart';
import 'package:vanilla_and_provider/product/padding/page_padding.dart';
import 'package:vanilla_and_provider/product/widgets/on_board_card_widget.dart';

part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = 'Skip';

  int _selectedPage = 0;
  bool get _isLastPage => OnBoardModels.onBoardItems.length - 1 == _selectedPage;
  bool get _isFirstPage => _selectedPage == 0;

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);

    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedPage = value;
      } else {
        _selectedPage++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _pageViewItems(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabIndicator(
                selectedIndex: _selectedPage,
              ),
              _StartFabButton(
                onpress: () {
                  _incrementAndChange();
                },
                isLastPage: _isLastPage,
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnable,
          builder: (BuildContext context, bool value, Widget? child) {
            return value ? const SizedBox() : TextButton(onPressed: () {}, child: Text(_skipTitle));
          },
        ),
      ],
      leading: _isFirstPage
          ? null
          : IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left_outlined, color: Colors.grey)),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
        onPageChanged: (value) {
          _incrementAndChange(value);
        },
        itemCount: OnBoardModels.onBoardItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const PagePadding.all(),
            child: OnBoardCard(model: OnBoardModels.onBoardItems[index]),
          );
        }));
  }
}
