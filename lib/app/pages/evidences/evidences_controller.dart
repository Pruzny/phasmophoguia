import 'package:get/get.dart';

import '../../core/domain/entities/evidence_entity.dart';
import '../../core/domain/entities/ghost_entity.dart';
import '../../core/domain/usecases/get_all_evidences_usecase.dart';
import '../../core/domain/usecases/get_all_ghosts_usecase.dart';
import '../../core/enums/evidence_status.dart';

class EvidencesController extends GetxController {
  final _isLoading = false.obs;

  final evidences = (<EvidenceEntity>[]).obs;

  final evidencesStatus = (<int, EvidenceStatus>{}).obs;

  final ghosts = (<GhostEntity>[]).obs;

  final GetAllEvidencesUsecase getAllEvidences;

  final GetAllGhostsUsecase getAllGhosts;

  EvidencesController({required this.getAllEvidences, required this.getAllGhosts});

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
    ghosts.clear();
    ghosts.addAll(await getAllGhosts(null));
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

  List<int> getRemainingEvidences(GhostEntity ghost) {
    return ghost.evidences.where((e) => evidencesStatus[e] == EvidenceStatus.notSelected).toList();
  }
}
