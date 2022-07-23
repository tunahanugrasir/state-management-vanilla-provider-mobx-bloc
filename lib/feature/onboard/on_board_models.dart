class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(this.title, this.description, this.imageName);

  String get imageWithPath => "";
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel('Order Your Food', 'Now you can order food any time right from your mobile',
        'https://www.pngmart.com/files/16/Chef-Cook-Vector-PNG-Clipart.png'),
    OnBoardModel('Order Your Food', 'Now you can order food any time right from your mobile',
        'https://www.pngmart.com/files/16/Chef-Vector-PNG-Transparent-Image.png'),
    OnBoardModel('Order Your Food', 'Now you can order food any time right from your mobile',
        'https://w7.pngwing.com/pngs/556/1015/png-transparent-chef-cartoon-chef-cartoon-people.png'),
  ];
}
