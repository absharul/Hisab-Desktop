import 'package:hisab/controllers/base_controller.dart';
import 'package:hisab/main.dart';

import '../database/app_database.dart';

class SiteController extends BaseController<Site, SitesCompanion> {
  @override
  Future<int> create(SitesCompanion model) async {
    try {
      final data = await database!.insertSite(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> delete(Site model) async {
    try {
      final data = await database!.deleteSite(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Site> read(int id) async {
    try {
      final data = await database!.getSite(id);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Site>> readAll() async {
    try {
      final data = await database!.getAllSites();
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> update(Site model) {
    try {
      final data = database!.updateSite(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<Site>> watchAll() {
    return database!.watchAllSites();
  }
}

final siteController = SiteController();
