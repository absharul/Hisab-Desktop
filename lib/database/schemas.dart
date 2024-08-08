import 'package:drift/drift.dart';

class Firms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Sites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().withLength(min: 1, max: 50)();
  IntColumn get firmId =>
      integer().customConstraint('REFERENCES firms(id) NOT NULL')();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Flats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get area => integer()();
  TextColumn get type => text().withLength(min: 1, max: 10)();
  IntColumn get rate => integer()();
  BoolColumn get isSold => boolean().withDefault(Constant(false))();
  IntColumn get siteId =>
      integer().customConstraint('REFERENCES sites(id) NOT NULL')();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class SubCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get categoryId =>
      integer().customConstraint('REFERENCES categories(id) NOT NULL')();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get type => text().withLength(min: 1, max: 50)();
  IntColumn get subCategory =>
      integer().customConstraint('REFERENCES subCategories(id) NOT NULL')();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class BankAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get accountNumber => text().withLength(min: 1, max: 50)();
  TextColumn get bankName => text().withLength(min: 1, max: 50)();
  TextColumn get ifsc => text().withLength(min: 1, max: 50)();
  TextColumn get accountHolder => text().withLength(min: 1, max: 50)();
}

class EntityPaymentMethods extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get entityId =>
      integer().customConstraint('REFERENCES users(id) NOT NULL')();
  TextColumn get entityType => text().withLength(min: 1, max: 50)();
  IntColumn get bankAccountId =>
      integer().customConstraint('REFERENCES bankAccounts(id) NOT NULL')();
  TextColumn get paymentMethod => text().withLength(min: 1, max: 50)();
}

class Partners extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get builderId =>
      integer().customConstraint('REFERENCES users(id) NOT NULL')();
  IntColumn get siteId =>
      integer().customConstraint('REFERENCES sites(id) NOT NULL')();
  IntColumn get share => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remarks => text().withLength(min: 1, max: 20)();
  IntColumn get amount => integer()();
  TextColumn get chequeNo => text().nullable()();
  IntColumn get fromId => integer()
      .customConstraint('REFERENCES entityPaymentMethods(id) NOT NULL')();
  IntColumn get toId => integer()
      .customConstraint('REFERENCES entityPaymentMethods(id) NOT NULL')();
  IntColumn get siteId =>
      integer().customConstraint('REFERENCES sites(id) NOT NULL')();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
