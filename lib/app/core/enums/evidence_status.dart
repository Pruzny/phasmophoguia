enum EvidenceStatus {
  notSelected,
  selected,
  discarded,
  impossible;

  static EvidenceStatus nextStatus(EvidenceStatus currentStatus) {
    return EvidenceStatus.values[(currentStatus.index + 1) % 3];
  }
}
