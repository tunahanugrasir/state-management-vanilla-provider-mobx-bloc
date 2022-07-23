import 'package:flutter/material.dart';
import 'package:vanilla_and_provider/feature/onboard/on_board_models.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({Key? key, required this.model}) : super(key: key);
  final OnBoardModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(model.title, style: Theme.of(context).textTheme.headline4),
        Text(model.description),
        SizedBox(
          height: 400,
          child: Image.network(model.imageName),
        )
      ],
    );
  }
}
