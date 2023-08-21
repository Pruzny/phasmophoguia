import 'dart:convert';

import '../../adapters/api_adapter.dart';
import '../../domain/entities/map_entity.dart';
import 'base_datasource.dart';

class MapsDatasource implements BaseDatasource<MapEntity> {
  final ApiAdapter _storage;

  MapsDatasource(this._storage);

  @override
  Future getAll() async {
    final mapsAsJson = List<Map<String, dynamic>>.from(
      jsonDecode(
        await _storage.readAll(),
      ),
    );

    return mapsAsJson.map((m) => MapEntity.fromMap(m)).toList();
  }

  @override
  Future getOne(int id) async {
    final maps = await getAll();

    final index = maps.indexWhere((m) => m.id == id);

    return index == -1 ? null : maps[index];
  }

  @override
  Future delete(int id) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future create(MapEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future update(MapEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future writeAll(List<MapEntity> objects) {
    // UNUSED
    throw UnimplementedError();
  }
}
