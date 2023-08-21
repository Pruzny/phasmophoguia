import 'package:get/get.dart';

import '../../core/domain/entities/map_entity.dart';
import '../../core/domain/usecases/get_all_maps_usecase.dart';

class MapsController extends GetxController {
  final _isLoading = false.obs;

  final _maps = (<MapEntity>[]).obs;

  final _selectedMap = 0.obs;

  final GetAllMapsUsecase getAllMaps;

  MapsController({required this.getAllMaps});

  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    _isLoading.value = true;

    fetch();
    super.onInit();

    _isLoading.value = false;
  }

  void fetch() async {
    _isLoading.value = true;

    _maps.clear();
    _maps.addAll(await getAllMaps(null));

    _isLoading.value = false;
  }

  void selectMap(int id) {
    _selectedMap.value = id;
  }
}
