import '../entities/ghost_entity.dart';
import '../repositories/get_all_ghosts_repository.dart';
import 'usecase.dart';

class GetAllGhostsUsecase implements Usecase<List<GhostEntity>, void> {
  final GetAllGhostsRepository _repository;

  GetAllGhostsUsecase(this._repository);

  @override
  Future<List<GhostEntity>> call(void params) async => await _repository();
}
