import 'package:get/get.dart';

import '../../core/domain/entities/map_entity.dart';
import '../../core/domain/usecases/get_all_maps_usecase.dart';

class MapsController extends GetxController {
  final _isLoading = false.obs;

  final _maps = (<MapEntity>[]).obs;

  late final Rx<MapEntity> _selectedMap;

  final GetAllMapsUsecase getAllMaps;

  MapsController({required this.getAllMaps});

  bool get isLoading => _isLoading.value;

  List<MapEntity> get maps => _maps;

  MapEntity get selectedMap => _selectedMap.value;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  void fetch() async {
    _isLoading.value = true;

    _maps.clear();
    _maps.addAll(await getAllMaps(null));

    _selectedMap = _maps.first.obs;

    _isLoading.value = false;
  }

  void selectMap(MapEntity map) {
    _selectedMap.value = map;
  }
}
