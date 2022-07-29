import 'package:vexana/vexana.dart';

import '../model/map_model.dart';

abstract class IMapService {
  final INetworkManager networkManager;

  IMapService(this.networkManager);

  Future<List<MapModel>?> fetchMapItems();
}

class MapService extends IMapService {
  MapService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<MapModel>?> fetchMapItems() async {
    final response = await networkManager.send<MapModel, List<MapModel>>(
      MapEndPoint.maps.withJson,
      parseModel: MapModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}

enum MapEndPoint { maps }

extension MapEndPointExtension on MapEndPoint {
  String get withJson => '$name.json';
}
