import 'package:get/get.dart';

class MapsController extends GetxController {
  final _isLoading = false.obs;

  final _selectedMap = 0.obs;

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

    _isLoading.value = false;
  }
}
