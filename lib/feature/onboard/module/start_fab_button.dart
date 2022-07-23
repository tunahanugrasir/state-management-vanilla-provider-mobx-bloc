part of '../on_board.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({Key? key, required this.isLastPage, required this.onpress}) : super(key: key);

  final bool isLastPage;
  final VoidCallback? onpress;
  final String _next = 'Next';
  final String _start = 'Start';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpress,
      child: Text(isLastPage ? _start : _next),
    );
  }
}
