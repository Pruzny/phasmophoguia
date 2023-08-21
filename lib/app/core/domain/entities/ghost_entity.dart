class GhostEntity {
  final int id;
  final String name;
  final List<int> evidences;

  GhostEntity({
    required this.id,
    required this.name,
    required this.evidences,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "evidences": evidences,
    };
  }

  factory GhostEntity.fromMap(Map<String, dynamic> map) {
    print(map);
    return GhostEntity(
      id: map["id"] as int,
      name: map["name"] as String,
      evidences: List<int>.from(map["evidences"] as List),
    );
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
