class EvidenceEntity {
  int id;
  String name;
  String label;

  EvidenceEntity({
    required this.id,
    required this.name,
    required this.label,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "label": label,
    };
  }

  factory EvidenceEntity.fromMap(Map<String, dynamic> map) {
    return EvidenceEntity(
      id: map["id"] as int,
      name: map["name"] as String,
      label: map["label"] as String,
    );
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
