import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Firms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().withLength(min: 1, max: 50)();
}

class Sites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().withLength(min: 1, max: 50)();
  IntColumn get firmId => integer().customConstraint('REFERENCES firms(id)')();
}

class Flats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get area =>
      integer()(); // Consider using Decimal for more precision
  TextColumn get type => text().withLength(min: 1, max: 10)();
  IntColumn get rate =>
      integer()(); // Consider using Decimal for more precision
  BoolColumn get isSold => boolean().withDefault(Constant(false))();
  IntColumn get siteId => integer().customConstraint('REFERENCES sites(id)')();
}

class Partners extends Table {
  //Partner
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get site => text().withLength(min: 1, max: 50)();
  DateTimeColumn get date => dateTime()();
}

class Transactions extends Table {
  //Transaction
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get entity => text().withLength(min: 1, max: 20)();
  TextColumn get transactionMethod => text().withLength(min: 1, max: 20)();
  IntColumn get amount => integer()();
  TextColumn get chequeNo => text().nullable()();
}

@DriftDatabase(tables: [Firms, Sites, Flats, Partners, Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // FIRMS
  Future<List<Firm>> getAllFirms() => select(firms).get();
  Stream<List<Firm>> watchAllFirms() => select(firms).watch();
  Future<int> insertFirm(Insertable<Firm> firm) => into(firms).insert(firm);

  // SITES
  Future<List<Site>> getAllSites() => select(sites).get();
  Stream<List<Site>> watchAllSites() => select(sites).watch();

  Future<int> insertSite(Insertable<Site> site) => into(sites).insert(site);

  // FLATS
  Future<List<Flat>> getAllFlats() => select(flats).get();
  Future<int> insertFlat(Insertable<Flats> flat) =>
      into(flats).insert(flat as Insertable<Flat>);

  Future<List<Partner>> getAllPartners() => select(partners).get();
  Future<int> insertPartner(Insertable<Partners> partner) =>
      into(partners).insert(partner as Insertable<Partner>);

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();
  Future<int> insertTransaction(Insertable<Transactions> transaction) =>
      into(transactions).insert(transaction as Insertable<Transaction>);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
