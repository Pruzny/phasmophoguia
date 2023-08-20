import '../../domain/repositories/get_all_evidences_repository.dart';
import '../../external/datasource/base_datasource.dart';

class GetAllEvidencesRepositoryImpl implements GetAllEvidencesRepository {
  final BaseDatasource _datasource;

  GetAllEvidencesRepositoryImpl(this._datasource);

  @override
  Future call() async => _datasource.getAll();
}
