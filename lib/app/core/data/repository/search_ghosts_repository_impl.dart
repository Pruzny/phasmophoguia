import '../../domain/entities/ghost_entity.dart';
import '../../domain/repositories/search_ghost_repository.dart';
import '../../enums/evidence_status.dart';
import '../../external/datasource/ghost_datasource.dart';

class SearchGhostRepositoryImpl implements SearchGhostRepository {
  final GhostDatasource _datasource;

  SearchGhostRepositoryImpl(this._datasource);

  @override
  Future<List<GhostEntity>> call(Map<int, EvidenceStatus> evidencesStatus) async {
    final allGhosts = await _datasource.getAll() as List<GhostEntity>;

    final selectedEvidences = evidencesStatus.entries.where((entry) => entry.value == EvidenceStatus.selected).map((entry) => entry.key).toList();

    final discardedEvidences = evidencesStatus.entries.where((entry) => entry.value == EvidenceStatus.discarded).map((entry) => entry.key).toList();

    if (selectedEvidences.isEmpty && discardedEvidences.isEmpty) {
      return allGhosts;
    }

    final selectedGhosts = <GhostEntity>[];

    for (var ghost in allGhosts) {
      final ghostEvidences = List<int>.from(ghost.evidences);

      final allSelected = selectedEvidences.every((evidence) => ghostEvidences.contains(evidence));
      final noDiscarded = discardedEvidences.every((evidence) => !ghostEvidences.contains(evidence));

      if (allSelected && noDiscarded) {
        selectedGhosts.add(ghost);
      }
    }

    return selectedGhosts;
  }
}
