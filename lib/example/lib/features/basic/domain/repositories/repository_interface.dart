import '../entities/entities.dart';

abstract interface class RepositoryInterface {
  Future<List<SomeEntity>> getList();

  Future<SomeEntity?> getEntity(int id);
}