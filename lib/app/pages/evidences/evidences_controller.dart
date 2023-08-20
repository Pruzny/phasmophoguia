import 'package:get/get.dart';

import '../../core/domain/usecases/get_all_evidences_usecase.dart';

class EvidencesController extends GetxController {
  var isLoading = false.obs;

  final GetAllEvidencesUsecase getAllEvidences;

  EvidencesController({required this.getAllEvidences});

  @override
  void onInit() async {
    super.onInit();
    await fetch();
  }

  Future fetch() async {
    isLoading.value = true;
    var evidences = await getAllEvidences(null);
    print(evidences);
    isLoading.value = false;
  }
}
