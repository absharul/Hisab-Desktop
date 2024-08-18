import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class SubCategoryController extends BaseController<SubCategory, SubCategoriesCompanion> {
  @override
  Future<int> create(SubCategoriesCompanion model) async {
    try {
      final data = await database.insertSubCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> delete(SubCategory model) async {
    try {
      final data = await database.deleteSubCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SubCategory> read(int id) async {
    try {
      final data = await database.getSubCategoryById(id); // Make sure this method returns a SubCategory
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<SubCategory>> readAll() async {
    try {
      final data = await database.getSubCategory();
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> update(SubCategory model) async {
    try {
      final data = await database.updateSubCategory(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<SubCategory>> watchAll() {
    return database.watchSubCategory();
  }
}

final subCategoryController = SubCategoryController();
