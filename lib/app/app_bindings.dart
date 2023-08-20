import 'package:get/get.dart';

import 'core/constants.dart';
import 'core/adapters/api_adapter.dart';
import 'core/external/datasource/evidence_datasource.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Storages
    Get.put<ApiAdapter>(
      ApiAdapterImpl(
        fileName: evidencesFileName,
      ),
    );

    // Datasources
    Get.put<EvidenceDatasource>(
      EvidenceDatasource(
        Get.find<ApiAdapter>(),
      ),
    );
  }
}
