import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class UserController extends BaseController<User, UsersCompanion> {
  @override
  Future<int> create(UsersCompanion model) async {
    try {
      final data = await database.insertUser(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> delete(User model) async {
    try {
      final data = await database.deleteUser(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User> read(int id) async {
    try {
      final data = await database.getUserById(id);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<User>> readAll() async {
    try {
      final data = await database.getUsers();
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> update(User model) async {
    try {
      final data = await database.updateUser(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<User>> watchAll() {
    return database.watchUser();
  }

  // Additional methods specific to User

  Future<List<User>> getUsersByCategoryId(int categoryId) async {
    try {
      final data = await database.getUsersByCategoryId(categoryId);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}

final userController = UserController();
