import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'base_controller.dart';

class PartnerController extends BaseController<Partner, PartnersCompanion> {
  PartnerController();

  // Create new partner
  @override
  Future<int> create(PartnersCompanion model) async {
    return await database.insertPartner(model);
  }

  // Read a specific partner by id
  @override
  Future<Partner> read(int id) async {
    return await database.getPartnerById(id);
  }

  // Read all partners for a specific site
  Future<List<Partner>> readAllBySite(int siteId) async {
    return await database.getAllPartnersBySite(siteId);
  }

  // Read all partners
  @override
  Future<List<Partner>> readAll() async {
    return await database.getAllPartners();
  }

  // Update partner
  @override
  Future<bool> update(Partner model) async {
    return await database.updatePartner(model);
  }

  // Delete partner
  @override
  Future<int> delete(Partner model) async {
    return await database.deletePartner(model);
  }

  // Watch partners (stream) for a specific site
  @override
  Stream<List<Partner>> watchAll() {
    throw UnimplementedError("Use `watchAllBySite` instead.");
  }

  // Watch partners (stream) for a specific site
  Stream<List<Partner>> watchAllBySite(int siteId) {
    return database.watchPartners(siteId);
  }
}

final partnerController = PartnerController();
