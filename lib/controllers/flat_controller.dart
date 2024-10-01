import 'package:hisab/database/app_database.dart';

import '../main.dart';

class FlatController {

  FlatController();

  Future<List<Flat>> fetchAllFlats(int siteId) {
    return database.getAllFlats();
  }

  // Add a new flat
  Future<void> addFlat(Flat flat) async {
    await database.insertFlat(flat);
  }

  // Update an existing flat
  Future<void> updateFlat(Flat flat) async {
    await database.updateFlat(flat);
  }

  // Delete a flat
  Future<void> deleteFlat(Flat flat) async {
    await database.deleteFlat(flat);
  }
}

final flatContoller = FlatController();
