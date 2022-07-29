import 'package:vexana/vexana.dart';

class NetworkProduct {
  static NetworkProduct? _instance;
  static NetworkProduct get instance {
    _instance ??= NetworkProduct._init();
    return _instance!;
  }

  late final INetworkManager networkManager;

  NetworkProduct._init() {
    networkManager = NetworkManager(
      options: BaseOptions(
        baseUrl: 'https://fluttertr-ead5c.firebaseio.com/',
      ),
    );
  }
}
