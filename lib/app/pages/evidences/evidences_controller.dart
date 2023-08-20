import 'package:get/get.dart';

import '../../core/domain/usecases/get_all_evidences_usecase.dart';

class EvidencesController extends GetxController {
  final _isLoading = false.obs;

  final evidences = [].obs;

  final GetAllEvidencesUsecase getAllEvidences;

  EvidencesController({required this.getAllEvidences});

  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    await fetch();
    super.onInit();
  }

  Future fetch() async {
    _isLoading.value = true;
    evidences.clear();
    evidences.addAll(await getAllEvidences(null));
    _isLoading.value = false;
  }
}
