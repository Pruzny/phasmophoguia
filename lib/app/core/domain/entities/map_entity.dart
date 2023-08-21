class MapEntity {
  int id;
  String name;
  String label;
  int mapSize;
  int floors;
  int rooms;
  int exits;
  int sinks;
  int cameras;

  MapEntity({
    required this.id,
    required this.name,
    required this.label,
    required this.mapSize,
    required this.floors,
    required this.rooms,
    required this.exits,
    required this.sinks,
    required this.cameras,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "label": label,
      "mapSize": mapSize,
      "floors": floors,
      "rooms": rooms,
      "exits": exits,
      "sinks": sinks,
      "cameras": cameras,
    };
  }

  factory MapEntity.fromMap(Map<String, dynamic> map) {
    return MapEntity(
      id: map["id"],
      name: map["name"],
      label: map["label"],
      mapSize: map["mapSize"],
      floors: map["floors"],
      rooms: map["rooms"],
      exits: map["exits"],
      sinks: map["sinks"],
      cameras: map["cameras"],
    );
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
