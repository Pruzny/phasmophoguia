import '../entities/map_entity.dart';
import '../repositories/get_all_maps_repository.dart';
import 'usecase.dart';

class GetAllMapsUsecase implements Usecase<List<MapEntity>, void> {
  final GetAllMapsRepository _repository;

  GetAllMapsUsecase(this._repository);

  @override
  Future<List<MapEntity>> call(void params) async => await _repository();
}
