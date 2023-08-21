import '../../domain/repositories/get_all_maps_repository.dart';
import '../../external/datasource/base_datasource.dart';

class GetAllMapsRepositoryImpl implements GetAllMapsRepository {
  final BaseDatasource _datasource;

  GetAllMapsRepositoryImpl(this._datasource);

  @override
  Future call() async => _datasource.getAll();
}
