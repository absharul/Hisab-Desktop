import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class CategoryController extends BaseController<Category, CategoriesCompanion> {
  @override
  Future<int> create(CategoriesCompanion model) async {
    try {
      final data = await database.insertCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> delete(Category model) async {
    try {
      final data = await database.deleteCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Category> read(int id) async {
    try {
      final data = await database.getCategoryById(id);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Category>> readAll() async {
    try {
      final data = await database.getCategory();
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> update(Category model) async {
    try {
      final data = await database.updateCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<Category>> watchAll() {
    return database.watchCategory();
  }
}

final categoryController = CategoryController();
