import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hisab/database/schemas.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Firms,
  Sites,
  Flats,
  Partners,
  Transactions,
  Categories,
  SubCategories,
  Users,
  BankAccounts,
  EntityPaymentMethods
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Firm>> getAllFirms() => select(firms).get();
  Future<Firm> getFirm(int id) =>
      (select(firms)..where((t) => t.id.equals(id))).getSingle();
  Stream<List<Firm>> watchAllFirms() => (select(firms)
        ..orderBy([
          (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
        ]))
      .watch();
  Future<int> updateFirm(Firm firm) => into(firms).insertOnConflictUpdate(firm);
  Future<int> insertFirm(Insertable<Firm> firm) => into(firms).insert(firm);
  Future<int> deleteFirm(Insertable<Firm> firm) => delete(firms).delete(firm);

  Future<List<Site>> getAllSites() => select(sites).get();
  Stream<List<Site>> watchAllSites() => (select(sites)
        ..orderBy([
          (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
        ]))
      .watch();
  Future<Site> getSite(int id) =>
      (select(sites)..where((t) => t.id.equals(id))).getSingle();
  Future<int> updateSite(Site site) => into(sites).insertOnConflictUpdate(site);
  Future<int> deleteSite(Insertable<Site> site) => delete(sites).delete(site);
  Future<int> insertSite(Insertable<Site> site) => into(sites).insert(site);

  Future<List<Flat>> getAllFlats() => select(flats).get();
  Future<int> insertFlat(Insertable<Flat> flat) => into(flats).insert(flat);

  Future<List<Partner>> getAllPartners() => select(partners).get();
  Future<int> insertPartner(Insertable<Partner> partner) =>
      into(partners).insert(partner);

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();
  Future<int> insertTransaction(Insertable<Transaction> transaction) =>
      into(transactions).insert(transaction);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
