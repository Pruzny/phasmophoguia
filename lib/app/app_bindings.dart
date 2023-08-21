import 'package:get/get.dart';
import 'package:phasmophoguia/app/core/constants.dart';
import 'package:phasmophoguia/app/core/external/datasource/ghost_datasource.dart';

import 'core/adapters/api_adapter.dart';
import 'core/external/datasource/evidence_datasource.dart';

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
