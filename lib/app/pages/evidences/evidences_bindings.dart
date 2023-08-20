import 'package:get/get.dart';

import '../../core/data/repository/get_all_evidences_repository_impl.dart';
import '../../core/domain/usecases/get_all_evidences_usecase.dart';
import '../../core/external/datasource/evidence_datasource.dart';
import 'evidences_controller.dart';

class EvidencesBindings extends Bindings {
  @override
  void dependencies() {
    // Get all evidences
    Get.lazyPut<GetAllEvidencesUsecase>(
      () => GetAllEvidencesUsecase(
        Get.put(
          GetAllEvidencesRepositoryImpl(
            Get.find<EvidenceDatasource>(),
          ),
        ),
      ),
    );

    // Controller
    Get.lazyPut<EvidencesController>(
      () => EvidencesController(
        getAllEvidences: Get.find<GetAllEvidencesUsecase>(),
      ),
    );
  }
}
