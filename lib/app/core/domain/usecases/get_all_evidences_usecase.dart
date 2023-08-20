import '../entities/evidence_entity.dart';
import '../repositories/get_all_evidences_repository.dart';
import 'usecase.dart';

class GetAllEvidencesUsecase implements Usecase<List<EvidenceEntity>, void> {
  final GetAllEvidencesRepository _repository;

  GetAllEvidencesUsecase(this._repository);

  @override
  Future<List<EvidenceEntity>> call(void params) async => await _repository();
}
