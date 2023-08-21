import 'package:get/get.dart';

import 'core/adapters/api_adapter.dart';
import 'core/constants.dart';
import 'core/external/datasource/evidence_datasource.dart';
import 'core/external/datasource/ghost_datasource.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Datasources
    Get.put<EvidenceDatasource>(
      EvidenceDatasource(
        ApiAdapterImpl(filePath: evidencesFileLocation),
      ),
    );
    Get.put<GhostDatasource>(
      GhostDatasource(
        ApiAdapterImpl(filePath: ghostsFileLocation),
      ),
    );
  }
}
