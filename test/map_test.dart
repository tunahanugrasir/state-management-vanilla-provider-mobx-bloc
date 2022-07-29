import 'package:flutter_test/flutter_test.dart';
import 'package:vanilla_and_provider/feature/maps/model/map_model.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: 'https://fluttertr-ead5c.firebaseio.com/'));

    test('Fetch All Map Data Test', () async {
      final response = await networkManager.send<MapModel, List<MapModel>>(
        'maps.json',
        parseModel: MapModel(),
        method: RequestType.GET,
      );
      expect(response.data, isNotNull);
    });
  });
}
