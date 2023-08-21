import '../../enums/evidence_status.dart';
import '../entities/ghost_entity.dart';
import '../repositories/search_ghost_repository.dart';
import 'usecase.dart';

class SearchGhostUsecase implements Usecase<List<GhostEntity>, Map<int, EvidenceStatus>> {
  final SearchGhostRepository repository;

  SearchGhostUsecase(this.repository);

  @override
  Future<List<GhostEntity>> call(Map<int, EvidenceStatus> evidencesStatus) async {
    return await repository(evidencesStatus);
  }
}
