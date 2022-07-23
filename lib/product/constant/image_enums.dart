import 'package:flutter/cupertino.dart';

enum Images { login }

extension ImagesExtension on Images {
  String _toPath() {
    switch (this) {
      case Images.login:
        return 'https://i.pinimg.com/originals/6b/1b/22/6b1b22573f9f3d4bba11a9fa5cb45652.png';
      default:
        return 'https://i.pinimg.com/originals/6b/1b/22/6b1b22573f9f3d4bba11a9fa5cb45652.png';
    }
  }

  Image get toImage => Image.network(_toPath());
}
