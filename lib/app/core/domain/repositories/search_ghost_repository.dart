import '../../enums/evidence_status.dart';

abstract class SearchGhostRepository {
  Future call(Map<int, EvidenceStatus> evidences);
}
