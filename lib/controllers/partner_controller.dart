import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class PartnerController extends BaseController<Partner, PartnersCompanion> {
  PartnerController();

  @override
  Future<int> create(PartnersCompanion model) async {
    return await database.insertPartner(model);
  }

  @override
  Future<Partner> read(int id) async {
    return await database.getPartnerById(id);
  }

  Future<List<Partner>> readAllBySite(int siteId) async {
    return await database.getAllPartnersBySite(siteId);
  }

  @override
  Future<List<Partner>> readAll() async {
    return await database.getAllPartners();
  }

  @override
  Future<bool> update(Partner model) async {
    return await database.updatePartner(model);
  }

  @override
  Future<int> delete(Partner model) async {
    return await database.deletePartner(model);
  }

  @override
  Stream<List<Partner>> watchAll() {
    throw UnimplementedError("Use `watchAllBySite` instead.");
  }

  Stream<List<Partner>> watchAllBySite(int siteId) {
    return database.watchPartners(siteId);
  }
}

final partnerController = PartnerController();
