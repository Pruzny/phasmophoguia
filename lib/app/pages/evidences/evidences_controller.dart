import 'package:get/get.dart';

import '../../core/domain/entities/evidence_entity.dart';
import '../../core/domain/entities/ghost_entity.dart';
import '../../core/domain/usecases/get_all_evidences_usecase.dart';
import '../../core/domain/usecases/get_all_ghosts_usecase.dart';
import '../../core/domain/usecases/search_ghost_usecase.dart';
import '../../core/enums/evidence_status.dart';

class EvidencesController extends GetxController {
  final _isLoading = false.obs;

  final evidences = (<EvidenceEntity>[]).obs;

  final evidencesStatus = (<int, EvidenceStatus>{}).obs;

  final ghosts = (<GhostEntity>[]).obs;

  final discardedGhosts = (<int>[]).obs;

  final GetAllEvidencesUsecase getAllEvidences;

  final GetAllGhostsUsecase getAllGhosts;

  final SearchGhostUsecase searchGhost;

  EvidencesController({required this.getAllEvidences, required this.getAllGhosts, required this.searchGhost});

  bool get isLoading => _isLoading.value;

  bool get foundGhost => ghosts.length == 1;

  bool get hasContent {
    for (var e in evidencesStatus.values) {
      if (e != EvidenceStatus.notSelected) {
        return true;
      }
    }

    return discardedGhosts.isNotEmpty;
  }

  @override
  void onInit() async {
    _isLoading.value = true;

    evidences.clear();
    evidences.addAll(await getAllEvidences(null));
    evidencesStatus.clear();
    evidencesStatus.addAll({for (var e in evidences) e.id: EvidenceStatus.notSelected});

    await fetch();
    super.onInit();

    _isLoading.value = false;
  }

  Future fetch() async {
    _isLoading.value = true;
    ghosts.clear();
    ghosts.addAll(await searchGhost(evidencesStatus));
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

  String getEvidenceName(int id) {
    return evidences.firstWhere((e) => e.id == id).name;
  }

  void handleGhostTap(GhostEntity ghost) {
    if (discardedGhosts.contains(ghost.id)) {
      discardedGhosts.remove(ghost.id);
    } else {
      discardedGhosts.add(ghost.id);
    }
  }

  void reset() {
    for (var e in evidencesStatus.keys) {
      evidencesStatus[e] = EvidenceStatus.notSelected;
    }

    discardedGhosts.clear();
  }
}
