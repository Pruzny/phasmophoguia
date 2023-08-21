import 'package:get/get.dart';

import 'maps_controller.dart';

class MapsBindings extends Bindings {
  @override
  void dependencies() {
    // Controller
    Get.lazyPut<MapsController>(
      () => MapsController(),
    );
  }
}
