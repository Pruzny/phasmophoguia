import 'package:get/get.dart';

import '../../core/data/repository/get_all_evidences_repository_impl.dart';
import '../../core/data/repository/get_all_ghosts_repository_impl.dart';
import '../../core/data/repository/search_ghosts_repository_impl.dart';
import '../../core/domain/repositories/get_all_evidences_repository.dart';
import '../../core/domain/usecases/get_all_evidences_usecase.dart';
import '../../core/domain/usecases/get_all_ghosts_usecase.dart';
import '../../core/domain/usecases/search_ghost_usecase.dart';
import '../../core/external/datasource/evidence_datasource.dart';
import '../../core/external/datasource/ghost_datasource.dart';
import 'evidences_controller.dart';

class EvidencesBindings extends Bindings {
  @override
  void dependencies() {
    // Get all evidences
    Get.lazyPut<GetAllEvidencesUsecase>(
      () => GetAllEvidencesUsecase(
        Get.put<GetAllEvidencesRepository>(
          GetAllEvidencesRepositoryImpl(
            Get.find<EvidenceDatasource>(),
          ),
        ),
      ),
    );

    // Get all ghosts
    Get.lazyPut<GetAllGhostsUsecase>(
      () => GetAllGhostsUsecase(
        Get.put(
          GetAllGhostsRepositoryImpl(
            Get.find<GhostDatasource>(),
          ),
        ),
      ),
    );

    // Search ghosts
    Get.lazyPut<SearchGhostUsecase>(
      () => SearchGhostUsecase(
        Get.put(
          SearchGhostRepositoryImpl(
            Get.find<GhostDatasource>(),
          ),
        ),
      ),
    );

    // Controller
    Get.lazyPut<EvidencesController>(
      () => EvidencesController(
        getAllEvidences: Get.find<GetAllEvidencesUsecase>(),
        getAllGhosts: Get.find<GetAllGhostsUsecase>(),
        searchGhost: Get.find<SearchGhostUsecase>(),
      ),
    );
  }
}
