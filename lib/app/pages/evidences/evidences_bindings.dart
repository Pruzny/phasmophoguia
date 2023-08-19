import 'package:get/get.dart';

import 'evidences_controller.dart';

class EvidencesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvidencesController>(
      () => EvidencesController(),
    );
  }
}
