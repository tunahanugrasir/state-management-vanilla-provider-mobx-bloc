// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MapViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$mapModelItemsAtom =
      Atom(name: '_MapViewModelBase.mapModelItems', context: context);

  @override
  List<MapModel> get mapModelItems {
    _$mapModelItemsAtom.reportRead();
    return super.mapModelItems;
  }

  @override
  set mapModelItems(List<MapModel> value) {
    _$mapModelItemsAtom.reportWrite(value, super.mapModelItems, () {
      super.mapModelItems = value;
    });
  }

  late final _$fetchAllMapsAsyncAction =
      AsyncAction('_MapViewModelBase.fetchAllMaps', context: context);

  @override
  Future<void> fetchAllMaps() {
    return _$fetchAllMapsAsyncAction.run(() => super.fetchAllMaps());
  }

  late final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
mapModelItems: ${mapModelItems}
    ''';
  }
}
