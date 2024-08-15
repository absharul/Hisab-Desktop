abstract class BaseController<T, E> {
  Future<int> create(E model);

  Future<T> read(int id);

  Future<List<T>> readAll();

  Future<bool> update(T model);

  Future<int> delete(T model);

  Stream<List<T>> watchAll();
}
