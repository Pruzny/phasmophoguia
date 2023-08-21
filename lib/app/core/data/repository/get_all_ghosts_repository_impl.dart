import '../../domain/repositories/get_all_ghosts_repository.dart';
import '../../external/datasource/base_datasource.dart';

class GetAllGhostsRepositoryImpl implements GetAllGhostsRepository {
  final BaseDatasource _datasource;

  GetAllGhostsRepositoryImpl(this._datasource);

  @override
  Future call() async => _datasource.getAll();
}
