import 'dart:convert';

import '../../adapters/api_adapter.dart';
import '../../domain/entities/ghost_entity.dart';
import 'base_datasource.dart';

class GhostDatasource implements BaseDatasource<GhostEntity> {
  final ApiAdapter _storage;

  GhostDatasource(this._storage);

  @override
  Future getAll() async {
    final ghostsAsJson = List<Map<String, dynamic>>.from(
      jsonDecode(await _storage.readAll()),
    );

    return ghostsAsJson.map((e) => GhostEntity.fromMap(e)).toList();
  }

  @override
  Future getOne(int id) async {
    final ghosts = await getAll();

    final index = ghosts.indexWhere((e) => e.id == id);

    return index == -1 ? null : ghosts[index];
  }

  @override
  Future delete(int id) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future create(GhostEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future update(GhostEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future writeAll(List<GhostEntity> objects) {
    // UNUSED
    throw UnimplementedError();
  }
}
