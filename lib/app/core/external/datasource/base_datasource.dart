abstract class BaseDatasource<Type> {
  Future getAll();

  Future getOne(int id);

  Future delete(int id);

  Future create(Type object);

  Future update(Type object);

  Future writeAll(List<Type> objects);
}
