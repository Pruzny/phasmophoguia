import 'package:get/get.dart';

import '../../core/adapters/api_adapter.dart';
import '../../core/constants.dart';
import '../../core/data/repository/get_all_maps_repository_impl.dart';
import '../../core/domain/repositories/get_all_maps_repository.dart';
import '../../core/domain/usecases/get_all_maps_usecase.dart';
import '../../core/external/datasource/maps_datasource.dart';
import 'maps_controller.dart';

class MapsBindings extends Bindings {
  @override
  void dependencies() {
    // Datasource
    Get.lazyPut<MapsDatasource>(
      () => MapsDatasource(
        ApiAdapterImpl(filePath: mapsFileLocation),
      ),
    );

    // Get all maps
    Get.lazyPut<GetAllMapsUsecase>(
      () => GetAllMapsUsecase(
        Get.put<GetAllMapsRepository>(
          GetAllMapsRepositoryImpl(
            Get.find<MapsDatasource>(),
          ),
        ),
      ),
    );

    // Controller
    Get.lazyPut<MapsController>(
      () => MapsController(getAllMaps: Get.find<GetAllMapsUsecase>()),
    );
  }
}
