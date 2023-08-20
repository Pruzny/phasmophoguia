import 'package:get/get.dart';

import '../../core/domain/entities/evidence_entity.dart';
import '../../core/domain/usecases/get_all_evidences_usecase.dart';
import '../../core/enums/evidence_status.dart';

class EvidencesController extends GetxController {
  final _isLoading = false.obs;

  final evidences = (<EvidenceEntity>[]).obs;

  final evidencesStatus = (<int, EvidenceStatus>{}).obs;

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
    evidencesStatus.clear();
    evidencesStatus.addAll({for (var e in evidences) e.id: EvidenceStatus.notSelected});
    _isLoading.value = false;
  }

  void changeEvidenceStatus(int evidenceId) {
    final currentStatus = evidencesStatus[evidenceId]!;

    if (currentStatus != EvidenceStatus.impossible) {
      evidencesStatus[evidenceId] = EvidenceStatus.nextStatus(currentStatus);
    }
  }

  EvidenceStatus getEvidenceStatus(int evidenceId) {
    return evidencesStatus[evidenceId]!;
  }
}
