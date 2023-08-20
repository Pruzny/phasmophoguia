import 'dart:convert';

import '../../adapters/api_adapter.dart';
import '../../domain/entities/evidence_entity.dart';
import 'base_datasource.dart';

class EvidenceDatasource implements BaseDatasource<EvidenceEntity> {
  final ApiAdapter _storage;

  EvidenceDatasource(this._storage);

  @override
  Future getAll() async {
    final evidencesAsJson = List<Map<String, dynamic>>.from(
      jsonDecode(await _storage.readAll()),
    );

    return evidencesAsJson.map((e) => EvidenceEntity.fromMap(e)).toList();
  }

  @override
  Future getOne(int id) async {
    final evidences = await getAll();

    final index = evidences.indexWhere((e) => e.id == id);

    return index == -1 ? null : evidences[index];
  }

  @override
  Future delete(int id) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future create(EvidenceEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future update(EvidenceEntity object) {
    // UNUSED
    throw UnimplementedError();
  }

  @override
  Future writeAll(List<EvidenceEntity> objects) {
    // UNUSED
    throw UnimplementedError();
  }
}
