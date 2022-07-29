import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../product/init/network/network_product.dart';
import '../../../product/utilities/extension/map_model_markers.dart';
import '../service/map_service.dart';
import '../view_model/map_view_model.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late final MapViewModel _mapViewModel;
  final double _kZeroPositioned = 0;
  GoogleMapController? gController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapViewModel = MapViewModel(MapService(NetworkProduct.instance.networkManager));
    _mapViewModel.fetchAllMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return _mapViewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                _googleMapView(),
                Positioned(
                  left: _kZeroPositioned,
                  right: _kZeroPositioned,
                  bottom: _kZeroPositioned,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: SizedBox(
                      height: 200,
                      child: Observer(
                        builder: (context) {
                          return PageView.builder(
                              onPageChanged: (value) {
                                _mapViewModel.changeIndex(value);
                                gController
                                    ?.animateCamera(CameraUpdate.newLatLng(_mapViewModel.mapModelItems[value].latlong));
                              },
                              itemCount: _mapViewModel.mapModelItems.length,
                              itemBuilder: ((context, index) {
                                var mapModelItem = _mapViewModel.mapModelItems[index];
                                return Card(
                                  elevation: 5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Image.network(
                                                    mapModelItem.detail?.photoUrl ?? '',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: (() {}),
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                                                  child: Text(mapModelItem.detail?.status ?? ''),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(
                                                mapModelItem.detail?.name ?? '',
                                                style: context.textTheme.headlineSmall,
                                              ),
                                              Text(mapModelItem.detail?.description ?? ''),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                );
                              }));
                        },
                      ),
                    ),
                  ),
                )
              ]);
      }),
    );
  }

  GoogleMap _googleMapView() {
    return GoogleMap(
      onMapCreated: (controller) {
        gController = controller;
      },
      markers: _mapViewModel.mapModelItems.toMarker(_mapViewModel.selectedIndex),
      initialCameraPosition: CameraPosition(target: _mapViewModel.mapModelItems.first.latlong, zoom: 12),
    );
  }
}
