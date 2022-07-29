import 'package:mobx/mobx.dart';

import '../model/map_model.dart';
import '../service/map_service.dart';

part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  final IMapService mapService;
  @observable
  bool isLoading = false;
  @observable
  int selectedIndex = 0;
  @observable
  List<MapModel> mapModelItems = [];
  _MapViewModelBase(this.mapService);

  @action
  Future<void> fetchAllMaps() async {
    _changeLoading();
    final response = await mapService.fetchMapItems();
    _changeLoading();
    mapModelItems = response ?? [];
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }
}
