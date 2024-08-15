import 'dart:developer';

import 'package:hisab/controllers/base_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';

class FirmController extends BaseController<Firm, FirmsCompanion> {
  @override
  Future<int> create(FirmsCompanion model) async {
    try {
      final data = await database.insertFirm(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> delete(Firm model) async {
    try {
      final data = await database.deleteFirm(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Firm> read(int id) async {
    try {
      final data = await database.getFirm(id);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Firm>> readAll() async {
    try {
      final data = await database.getAllFirms();
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> update(Firm model) async {
    try {
      final data = database.updateFirm(model);
      return data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<Firm>> watchAll() {
    final data = database.watchAllFirms();
    log(data.length.toString());
    return data;
  }
}

final firmController = FirmController();
