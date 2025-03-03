// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FirmsTable extends Firms with TableInfo<$FirmsTable, Firm> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FirmsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, address, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'firms';
  @override
  VerificationContext validateIntegrity(Insertable<Firm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Firm map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Firm(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FirmsTable createAlias(String alias) {
    return $FirmsTable(attachedDatabase, alias);
  }
}

class Firm extends DataClass implements Insertable<Firm> {
  final int id;
  final String name;
  final String? address;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Firm(
      {required this.id,
      required this.name,
      this.address,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FirmsCompanion toCompanion(bool nullToAbsent) {
    return FirmsCompanion(
      id: Value(id),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Firm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Firm(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Firm copyWith(
          {int? id,
          String? name,
          Value<String?> address = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Firm(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address.present ? address.value : this.address,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Firm copyWithCompanion(FirmsCompanion data) {
    return Firm(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Firm(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Firm &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FirmsCompanion extends UpdateCompanion<Firm> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FirmsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FirmsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Firm> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FirmsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? address,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return FirmsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirmsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firmIdMeta = const VerificationMeta('firmId');
  @override
  late final GeneratedColumn<int> firmId = GeneratedColumn<int>(
      'firm_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES firms(id) NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, address, firmId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('firm_id')) {
      context.handle(_firmIdMeta,
          firmId.isAcceptableOrUnknown(data['firm_id']!, _firmIdMeta));
    } else if (isInserting) {
      context.missing(_firmIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Site map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Site(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      firmId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}firm_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(attachedDatabase, alias);
  }
}

class Site extends DataClass implements Insertable<Site> {
  final int id;
  final String name;
  final String? address;
  final int firmId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Site(
      {required this.id,
      required this.name,
      this.address,
      required this.firmId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['firm_id'] = Variable<int>(firmId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      id: Value(id),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      firmId: Value(firmId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Site(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      firmId: serializer.fromJson<int>(json['firmId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'firmId': serializer.toJson<int>(firmId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Site copyWith(
          {int? id,
          String? name,
          Value<String?> address = const Value.absent(),
          int? firmId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Site(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address.present ? address.value : this.address,
        firmId: firmId ?? this.firmId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Site copyWithCompanion(SitesCompanion data) {
    return Site(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      firmId: data.firmId.present ? data.firmId.value : this.firmId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('firmId: $firmId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, address, firmId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Site &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.firmId == this.firmId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<int> firmId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SitesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.firmId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SitesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.address = const Value.absent(),
    required int firmId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        firmId = Value(firmId);
  static Insertable<Site> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<int>? firmId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (firmId != null) 'firm_id': firmId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SitesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? address,
      Value<int>? firmId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SitesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      firmId: firmId ?? this.firmId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (firmId.present) {
      map['firm_id'] = Variable<int>(firmId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('firmId: $firmId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<int> subCategory = GeneratedColumn<int>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES subCategories(id) NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, subCategory, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_category'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final int subCategory;
  final DateTime createdAt;
  final DateTime updatedAt;
  const User(
      {required this.id,
      required this.name,
      required this.subCategory,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<int>(subCategory);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<int>(json['subCategory']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<int>(subCategory),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          int? subCategory,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> subCategory;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int subCategory,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? subCategory,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? subCategory,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<int>(subCategory.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FlatsTable extends Flats with TableInfo<$FlatsTable, Flat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<int> area = GeneratedColumn<int>(
      'area', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<int> rate = GeneratedColumn<int>(
      'rate', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isSoldMeta = const VerificationMeta('isSold');
  @override
  late final GeneratedColumn<bool> isSold = GeneratedColumn<bool>(
      'is_sold', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sold" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'site_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES sites(id) NOT NULL');
  static const VerificationMeta _buyerIdMeta =
      const VerificationMeta('buyerId');
  @override
  late final GeneratedColumn<int> buyerId = GeneratedColumn<int>(
      'buyer_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES users(id)');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        area,
        type,
        rate,
        isSold,
        siteId,
        buyerId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flats';
  @override
  VerificationContext validateIntegrity(Insertable<Flat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('is_sold')) {
      context.handle(_isSoldMeta,
          isSold.isAcceptableOrUnknown(data['is_sold']!, _isSoldMeta));
    }
    if (data.containsKey('site_id')) {
      context.handle(_siteIdMeta,
          siteId.isAcceptableOrUnknown(data['site_id']!, _siteIdMeta));
    } else if (isInserting) {
      context.missing(_siteIdMeta);
    }
    if (data.containsKey('buyer_id')) {
      context.handle(_buyerIdMeta,
          buyerId.isAcceptableOrUnknown(data['buyer_id']!, _buyerIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}area'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rate'])!,
      isSold: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sold'])!,
      siteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}site_id'])!,
      buyerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}buyer_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FlatsTable createAlias(String alias) {
    return $FlatsTable(attachedDatabase, alias);
  }
}

class Flat extends DataClass implements Insertable<Flat> {
  final int id;
  final String name;
  final int area;
  final String type;
  final int rate;
  final bool isSold;
  final int siteId;
  final int? buyerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Flat(
      {required this.id,
      required this.name,
      required this.area,
      required this.type,
      required this.rate,
      required this.isSold,
      required this.siteId,
      this.buyerId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['area'] = Variable<int>(area);
    map['type'] = Variable<String>(type);
    map['rate'] = Variable<int>(rate);
    map['is_sold'] = Variable<bool>(isSold);
    map['site_id'] = Variable<int>(siteId);
    if (!nullToAbsent || buyerId != null) {
      map['buyer_id'] = Variable<int>(buyerId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FlatsCompanion toCompanion(bool nullToAbsent) {
    return FlatsCompanion(
      id: Value(id),
      name: Value(name),
      area: Value(area),
      type: Value(type),
      rate: Value(rate),
      isSold: Value(isSold),
      siteId: Value(siteId),
      buyerId: buyerId == null && nullToAbsent
          ? const Value.absent()
          : Value(buyerId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Flat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flat(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      area: serializer.fromJson<int>(json['area']),
      type: serializer.fromJson<String>(json['type']),
      rate: serializer.fromJson<int>(json['rate']),
      isSold: serializer.fromJson<bool>(json['isSold']),
      siteId: serializer.fromJson<int>(json['siteId']),
      buyerId: serializer.fromJson<int?>(json['buyerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'area': serializer.toJson<int>(area),
      'type': serializer.toJson<String>(type),
      'rate': serializer.toJson<int>(rate),
      'isSold': serializer.toJson<bool>(isSold),
      'siteId': serializer.toJson<int>(siteId),
      'buyerId': serializer.toJson<int?>(buyerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Flat copyWith(
          {int? id,
          String? name,
          int? area,
          String? type,
          int? rate,
          bool? isSold,
          int? siteId,
          Value<int?> buyerId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Flat(
        id: id ?? this.id,
        name: name ?? this.name,
        area: area ?? this.area,
        type: type ?? this.type,
        rate: rate ?? this.rate,
        isSold: isSold ?? this.isSold,
        siteId: siteId ?? this.siteId,
        buyerId: buyerId.present ? buyerId.value : this.buyerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Flat copyWithCompanion(FlatsCompanion data) {
    return Flat(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      area: data.area.present ? data.area.value : this.area,
      type: data.type.present ? data.type.value : this.type,
      rate: data.rate.present ? data.rate.value : this.rate,
      isSold: data.isSold.present ? data.isSold.value : this.isSold,
      siteId: data.siteId.present ? data.siteId.value : this.siteId,
      buyerId: data.buyerId.present ? data.buyerId.value : this.buyerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Flat(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('area: $area, ')
          ..write('type: $type, ')
          ..write('rate: $rate, ')
          ..write('isSold: $isSold, ')
          ..write('siteId: $siteId, ')
          ..write('buyerId: $buyerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, area, type, rate, isSold, siteId,
      buyerId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flat &&
          other.id == this.id &&
          other.name == this.name &&
          other.area == this.area &&
          other.type == this.type &&
          other.rate == this.rate &&
          other.isSold == this.isSold &&
          other.siteId == this.siteId &&
          other.buyerId == this.buyerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FlatsCompanion extends UpdateCompanion<Flat> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> area;
  final Value<String> type;
  final Value<int> rate;
  final Value<bool> isSold;
  final Value<int> siteId;
  final Value<int?> buyerId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FlatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.area = const Value.absent(),
    this.type = const Value.absent(),
    this.rate = const Value.absent(),
    this.isSold = const Value.absent(),
    this.siteId = const Value.absent(),
    this.buyerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FlatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int area,
    required String type,
    required int rate,
    this.isSold = const Value.absent(),
    required int siteId,
    this.buyerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        area = Value(area),
        type = Value(type),
        rate = Value(rate),
        siteId = Value(siteId);
  static Insertable<Flat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? area,
    Expression<String>? type,
    Expression<int>? rate,
    Expression<bool>? isSold,
    Expression<int>? siteId,
    Expression<int>? buyerId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (area != null) 'area': area,
      if (type != null) 'type': type,
      if (rate != null) 'rate': rate,
      if (isSold != null) 'is_sold': isSold,
      if (siteId != null) 'site_id': siteId,
      if (buyerId != null) 'buyer_id': buyerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FlatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? area,
      Value<String>? type,
      Value<int>? rate,
      Value<bool>? isSold,
      Value<int>? siteId,
      Value<int?>? buyerId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return FlatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      isSold: isSold ?? this.isSold,
      siteId: siteId ?? this.siteId,
      buyerId: buyerId ?? this.buyerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (area.present) {
      map['area'] = Variable<int>(area.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rate.present) {
      map['rate'] = Variable<int>(rate.value);
    }
    if (isSold.present) {
      map['is_sold'] = Variable<bool>(isSold.value);
    }
    if (siteId.present) {
      map['site_id'] = Variable<int>(siteId.value);
    }
    if (buyerId.present) {
      map['buyer_id'] = Variable<int>(buyerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('area: $area, ')
          ..write('type: $type, ')
          ..write('rate: $rate, ')
          ..write('isSold: $isSold, ')
          ..write('siteId: $siteId, ')
          ..write('buyerId: $buyerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Category(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Category copyWith(
          {int? id, String? name, DateTime? createdAt, DateTime? updatedAt}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubCategoriesTable extends SubCategories
    with TableInfo<$SubCategoriesTable, SubCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES categories(id) NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, categoryId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_categories';
  @override
  VerificationContext validateIntegrity(Insertable<SubCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SubCategoriesTable createAlias(String alias) {
    return $SubCategoriesTable(attachedDatabase, alias);
  }
}

class SubCategory extends DataClass implements Insertable<SubCategory> {
  final int id;
  final String name;
  final int categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SubCategory(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(categoryId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubCategoriesCompanion toCompanion(bool nullToAbsent) {
    return SubCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      categoryId: Value(categoryId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SubCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<int>(categoryId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubCategory copyWith(
          {int? id,
          String? name,
          int? categoryId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SubCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SubCategory copyWithCompanion(SubCategoriesCompanion data) {
    return SubCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, categoryId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubCategoriesCompanion extends UpdateCompanion<SubCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SubCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int categoryId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        categoryId = Value(categoryId);
  static Insertable<SubCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? categoryId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? categoryId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SubCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BankAccountsTable extends BankAccounts
    with TableInfo<$BankAccountsTable, BankAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
      'account_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ifscMeta = const VerificationMeta('ifsc');
  @override
  late final GeneratedColumn<String> ifsc = GeneratedColumn<String>(
      'ifsc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _accountHolderMeta =
      const VerificationMeta('accountHolder');
  @override
  late final GeneratedColumn<String> accountHolder = GeneratedColumn<String>(
      'account_holder', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountNumber,
        entityId,
        entityType,
        bankName,
        ifsc,
        accountHolder,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<BankAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('ifsc')) {
      context.handle(
          _ifscMeta, ifsc.isAcceptableOrUnknown(data['ifsc']!, _ifscMeta));
    } else if (isInserting) {
      context.missing(_ifscMeta);
    }
    if (data.containsKey('account_holder')) {
      context.handle(
          _accountHolderMeta,
          accountHolder.isAcceptableOrUnknown(
              data['account_holder']!, _accountHolderMeta));
    } else if (isInserting) {
      context.missing(_accountHolderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_number'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name'])!,
      ifsc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ifsc'])!,
      accountHolder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_holder'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BankAccountsTable createAlias(String alias) {
    return $BankAccountsTable(attachedDatabase, alias);
  }
}

class BankAccount extends DataClass implements Insertable<BankAccount> {
  final int id;
  final String accountNumber;
  final int entityId;
  final String entityType;
  final String bankName;
  final String ifsc;
  final String accountHolder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BankAccount(
      {required this.id,
      required this.accountNumber,
      required this.entityId,
      required this.entityType,
      required this.bankName,
      required this.ifsc,
      required this.accountHolder,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_number'] = Variable<String>(accountNumber);
    map['entity_id'] = Variable<int>(entityId);
    map['entity_type'] = Variable<String>(entityType);
    map['bank_name'] = Variable<String>(bankName);
    map['ifsc'] = Variable<String>(ifsc);
    map['account_holder'] = Variable<String>(accountHolder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BankAccountsCompanion toCompanion(bool nullToAbsent) {
    return BankAccountsCompanion(
      id: Value(id),
      accountNumber: Value(accountNumber),
      entityId: Value(entityId),
      entityType: Value(entityType),
      bankName: Value(bankName),
      ifsc: Value(ifsc),
      accountHolder: Value(accountHolder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BankAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankAccount(
      id: serializer.fromJson<int>(json['id']),
      accountNumber: serializer.fromJson<String>(json['accountNumber']),
      entityId: serializer.fromJson<int>(json['entityId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      bankName: serializer.fromJson<String>(json['bankName']),
      ifsc: serializer.fromJson<String>(json['ifsc']),
      accountHolder: serializer.fromJson<String>(json['accountHolder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountNumber': serializer.toJson<String>(accountNumber),
      'entityId': serializer.toJson<int>(entityId),
      'entityType': serializer.toJson<String>(entityType),
      'bankName': serializer.toJson<String>(bankName),
      'ifsc': serializer.toJson<String>(ifsc),
      'accountHolder': serializer.toJson<String>(accountHolder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BankAccount copyWith(
          {int? id,
          String? accountNumber,
          int? entityId,
          String? entityType,
          String? bankName,
          String? ifsc,
          String? accountHolder,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BankAccount(
        id: id ?? this.id,
        accountNumber: accountNumber ?? this.accountNumber,
        entityId: entityId ?? this.entityId,
        entityType: entityType ?? this.entityType,
        bankName: bankName ?? this.bankName,
        ifsc: ifsc ?? this.ifsc,
        accountHolder: accountHolder ?? this.accountHolder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BankAccount copyWithCompanion(BankAccountsCompanion data) {
    return BankAccount(
      id: data.id.present ? data.id.value : this.id,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      ifsc: data.ifsc.present ? data.ifsc.value : this.ifsc,
      accountHolder: data.accountHolder.present
          ? data.accountHolder.value
          : this.accountHolder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankAccount(')
          ..write('id: $id, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('entityId: $entityId, ')
          ..write('entityType: $entityType, ')
          ..write('bankName: $bankName, ')
          ..write('ifsc: $ifsc, ')
          ..write('accountHolder: $accountHolder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountNumber, entityId, entityType,
      bankName, ifsc, accountHolder, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankAccount &&
          other.id == this.id &&
          other.accountNumber == this.accountNumber &&
          other.entityId == this.entityId &&
          other.entityType == this.entityType &&
          other.bankName == this.bankName &&
          other.ifsc == this.ifsc &&
          other.accountHolder == this.accountHolder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BankAccountsCompanion extends UpdateCompanion<BankAccount> {
  final Value<int> id;
  final Value<String> accountNumber;
  final Value<int> entityId;
  final Value<String> entityType;
  final Value<String> bankName;
  final Value<String> ifsc;
  final Value<String> accountHolder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BankAccountsCompanion({
    this.id = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.bankName = const Value.absent(),
    this.ifsc = const Value.absent(),
    this.accountHolder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BankAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String accountNumber,
    required int entityId,
    required String entityType,
    required String bankName,
    required String ifsc,
    required String accountHolder,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : accountNumber = Value(accountNumber),
        entityId = Value(entityId),
        entityType = Value(entityType),
        bankName = Value(bankName),
        ifsc = Value(ifsc),
        accountHolder = Value(accountHolder);
  static Insertable<BankAccount> custom({
    Expression<int>? id,
    Expression<String>? accountNumber,
    Expression<int>? entityId,
    Expression<String>? entityType,
    Expression<String>? bankName,
    Expression<String>? ifsc,
    Expression<String>? accountHolder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountNumber != null) 'account_number': accountNumber,
      if (entityId != null) 'entity_id': entityId,
      if (entityType != null) 'entity_type': entityType,
      if (bankName != null) 'bank_name': bankName,
      if (ifsc != null) 'ifsc': ifsc,
      if (accountHolder != null) 'account_holder': accountHolder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BankAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountNumber,
      Value<int>? entityId,
      Value<String>? entityType,
      Value<String>? bankName,
      Value<String>? ifsc,
      Value<String>? accountHolder,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BankAccountsCompanion(
      id: id ?? this.id,
      accountNumber: accountNumber ?? this.accountNumber,
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      bankName: bankName ?? this.bankName,
      ifsc: ifsc ?? this.ifsc,
      accountHolder: accountHolder ?? this.accountHolder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (ifsc.present) {
      map['ifsc'] = Variable<String>(ifsc.value);
    }
    if (accountHolder.present) {
      map['account_holder'] = Variable<String>(accountHolder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('entityId: $entityId, ')
          ..write('entityType: $entityType, ')
          ..write('bankName: $bankName, ')
          ..write('ifsc: $ifsc, ')
          ..write('accountHolder: $accountHolder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EntityPaymentMethodsTable extends EntityPaymentMethods
    with TableInfo<$EntityPaymentMethodsTable, EntityPaymentMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntityPaymentMethodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _bankAccountIdMeta =
      const VerificationMeta('bankAccountId');
  @override
  late final GeneratedColumn<int> bankAccountId = GeneratedColumn<int>(
      'bank_account_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES bankAccounts(id) NULL');
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityId, entityType, bankAccountId, paymentMethod];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entity_payment_methods';
  @override
  VerificationContext validateIntegrity(
      Insertable<EntityPaymentMethod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('bank_account_id')) {
      context.handle(
          _bankAccountIdMeta,
          bankAccountId.isAcceptableOrUnknown(
              data['bank_account_id']!, _bankAccountIdMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntityPaymentMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntityPaymentMethod(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      bankAccountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_account_id']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
    );
  }

  @override
  $EntityPaymentMethodsTable createAlias(String alias) {
    return $EntityPaymentMethodsTable(attachedDatabase, alias);
  }
}

class EntityPaymentMethod extends DataClass
    implements Insertable<EntityPaymentMethod> {
  final int id;
  final int entityId;
  final String entityType;
  final int? bankAccountId;
  final String paymentMethod;
  const EntityPaymentMethod(
      {required this.id,
      required this.entityId,
      required this.entityType,
      this.bankAccountId,
      required this.paymentMethod});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_id'] = Variable<int>(entityId);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || bankAccountId != null) {
      map['bank_account_id'] = Variable<int>(bankAccountId);
    }
    map['payment_method'] = Variable<String>(paymentMethod);
    return map;
  }

  EntityPaymentMethodsCompanion toCompanion(bool nullToAbsent) {
    return EntityPaymentMethodsCompanion(
      id: Value(id),
      entityId: Value(entityId),
      entityType: Value(entityType),
      bankAccountId: bankAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountId),
      paymentMethod: Value(paymentMethod),
    );
  }

  factory EntityPaymentMethod.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntityPaymentMethod(
      id: serializer.fromJson<int>(json['id']),
      entityId: serializer.fromJson<int>(json['entityId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      bankAccountId: serializer.fromJson<int?>(json['bankAccountId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityId': serializer.toJson<int>(entityId),
      'entityType': serializer.toJson<String>(entityType),
      'bankAccountId': serializer.toJson<int?>(bankAccountId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
    };
  }

  EntityPaymentMethod copyWith(
          {int? id,
          int? entityId,
          String? entityType,
          Value<int?> bankAccountId = const Value.absent(),
          String? paymentMethod}) =>
      EntityPaymentMethod(
        id: id ?? this.id,
        entityId: entityId ?? this.entityId,
        entityType: entityType ?? this.entityType,
        bankAccountId:
            bankAccountId.present ? bankAccountId.value : this.bankAccountId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
  EntityPaymentMethod copyWithCompanion(EntityPaymentMethodsCompanion data) {
    return EntityPaymentMethod(
      id: data.id.present ? data.id.value : this.id,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      bankAccountId: data.bankAccountId.present
          ? data.bankAccountId.value
          : this.bankAccountId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntityPaymentMethod(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('entityType: $entityType, ')
          ..write('bankAccountId: $bankAccountId, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entityId, entityType, bankAccountId, paymentMethod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntityPaymentMethod &&
          other.id == this.id &&
          other.entityId == this.entityId &&
          other.entityType == this.entityType &&
          other.bankAccountId == this.bankAccountId &&
          other.paymentMethod == this.paymentMethod);
}

class EntityPaymentMethodsCompanion
    extends UpdateCompanion<EntityPaymentMethod> {
  final Value<int> id;
  final Value<int> entityId;
  final Value<String> entityType;
  final Value<int?> bankAccountId;
  final Value<String> paymentMethod;
  const EntityPaymentMethodsCompanion({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.bankAccountId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  });
  EntityPaymentMethodsCompanion.insert({
    this.id = const Value.absent(),
    required int entityId,
    required String entityType,
    this.bankAccountId = const Value.absent(),
    required String paymentMethod,
  })  : entityId = Value(entityId),
        entityType = Value(entityType),
        paymentMethod = Value(paymentMethod);
  static Insertable<EntityPaymentMethod> custom({
    Expression<int>? id,
    Expression<int>? entityId,
    Expression<String>? entityType,
    Expression<int>? bankAccountId,
    Expression<String>? paymentMethod,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityId != null) 'entity_id': entityId,
      if (entityType != null) 'entity_type': entityType,
      if (bankAccountId != null) 'bank_account_id': bankAccountId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
    });
  }

  EntityPaymentMethodsCompanion copyWith(
      {Value<int>? id,
      Value<int>? entityId,
      Value<String>? entityType,
      Value<int?>? bankAccountId,
      Value<String>? paymentMethod}) {
    return EntityPaymentMethodsCompanion(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      bankAccountId: bankAccountId ?? this.bankAccountId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (bankAccountId.present) {
      map['bank_account_id'] = Variable<int>(bankAccountId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntityPaymentMethodsCompanion(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('entityType: $entityType, ')
          ..write('bankAccountId: $bankAccountId, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }
}

class $PartnersTable extends Partners with TableInfo<$PartnersTable, Partner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _builderIdMeta =
      const VerificationMeta('builderId');
  @override
  late final GeneratedColumn<int> builderId = GeneratedColumn<int>(
      'builder_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'site_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES sites(id) NOT NULL');
  static const VerificationMeta _shareMeta = const VerificationMeta('share');
  @override
  late final GeneratedColumn<int> share = GeneratedColumn<int>(
      'share', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, builderId, siteId, share];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partners';
  @override
  VerificationContext validateIntegrity(Insertable<Partner> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('builder_id')) {
      context.handle(_builderIdMeta,
          builderId.isAcceptableOrUnknown(data['builder_id']!, _builderIdMeta));
    } else if (isInserting) {
      context.missing(_builderIdMeta);
    }
    if (data.containsKey('site_id')) {
      context.handle(_siteIdMeta,
          siteId.isAcceptableOrUnknown(data['site_id']!, _siteIdMeta));
    } else if (isInserting) {
      context.missing(_siteIdMeta);
    }
    if (data.containsKey('share')) {
      context.handle(
          _shareMeta, share.isAcceptableOrUnknown(data['share']!, _shareMeta));
    } else if (isInserting) {
      context.missing(_shareMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Partner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partner(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      builderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}builder_id'])!,
      siteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}site_id'])!,
      share: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}share'])!,
    );
  }

  @override
  $PartnersTable createAlias(String alias) {
    return $PartnersTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  final int id;
  final int builderId;
  final int siteId;
  final int share;
  const Partner(
      {required this.id,
      required this.builderId,
      required this.siteId,
      required this.share});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['builder_id'] = Variable<int>(builderId);
    map['site_id'] = Variable<int>(siteId);
    map['share'] = Variable<int>(share);
    return map;
  }

  PartnersCompanion toCompanion(bool nullToAbsent) {
    return PartnersCompanion(
      id: Value(id),
      builderId: Value(builderId),
      siteId: Value(siteId),
      share: Value(share),
    );
  }

  factory Partner.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      id: serializer.fromJson<int>(json['id']),
      builderId: serializer.fromJson<int>(json['builderId']),
      siteId: serializer.fromJson<int>(json['siteId']),
      share: serializer.fromJson<int>(json['share']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'builderId': serializer.toJson<int>(builderId),
      'siteId': serializer.toJson<int>(siteId),
      'share': serializer.toJson<int>(share),
    };
  }

  Partner copyWith({int? id, int? builderId, int? siteId, int? share}) =>
      Partner(
        id: id ?? this.id,
        builderId: builderId ?? this.builderId,
        siteId: siteId ?? this.siteId,
        share: share ?? this.share,
      );
  Partner copyWithCompanion(PartnersCompanion data) {
    return Partner(
      id: data.id.present ? data.id.value : this.id,
      builderId: data.builderId.present ? data.builderId.value : this.builderId,
      siteId: data.siteId.present ? data.siteId.value : this.siteId,
      share: data.share.present ? data.share.value : this.share,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('id: $id, ')
          ..write('builderId: $builderId, ')
          ..write('siteId: $siteId, ')
          ..write('share: $share')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, builderId, siteId, share);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.id == this.id &&
          other.builderId == this.builderId &&
          other.siteId == this.siteId &&
          other.share == this.share);
}

class PartnersCompanion extends UpdateCompanion<Partner> {
  final Value<int> id;
  final Value<int> builderId;
  final Value<int> siteId;
  final Value<int> share;
  const PartnersCompanion({
    this.id = const Value.absent(),
    this.builderId = const Value.absent(),
    this.siteId = const Value.absent(),
    this.share = const Value.absent(),
  });
  PartnersCompanion.insert({
    this.id = const Value.absent(),
    required int builderId,
    required int siteId,
    required int share,
  })  : builderId = Value(builderId),
        siteId = Value(siteId),
        share = Value(share);
  static Insertable<Partner> custom({
    Expression<int>? id,
    Expression<int>? builderId,
    Expression<int>? siteId,
    Expression<int>? share,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (builderId != null) 'builder_id': builderId,
      if (siteId != null) 'site_id': siteId,
      if (share != null) 'share': share,
    });
  }

  PartnersCompanion copyWith(
      {Value<int>? id,
      Value<int>? builderId,
      Value<int>? siteId,
      Value<int>? share}) {
    return PartnersCompanion(
      id: id ?? this.id,
      builderId: builderId ?? this.builderId,
      siteId: siteId ?? this.siteId,
      share: share ?? this.share,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (builderId.present) {
      map['builder_id'] = Variable<int>(builderId.value);
    }
    if (siteId.present) {
      map['site_id'] = Variable<int>(siteId.value);
    }
    if (share.present) {
      map['share'] = Variable<int>(share.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnersCompanion(')
          ..write('id: $id, ')
          ..write('builderId: $builderId, ')
          ..write('siteId: $siteId, ')
          ..write('share: $share')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _chequeNoMeta =
      const VerificationMeta('chequeNo');
  @override
  late final GeneratedColumn<String> chequeNo = GeneratedColumn<String>(
      'cheque_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fromIdMeta = const VerificationMeta('fromId');
  @override
  late final GeneratedColumn<int> fromId = GeneratedColumn<int>(
      'from_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES entityPaymentMethods(id) NOT NULL');
  static const VerificationMeta _toIdMeta = const VerificationMeta('toId');
  @override
  late final GeneratedColumn<int> toId = GeneratedColumn<int>(
      'to_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES entityPaymentMethods(id) NOT NULL');
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'site_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES sites(id) NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remarks,
        amount,
        chequeNo,
        fromId,
        toId,
        siteId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    } else if (isInserting) {
      context.missing(_remarksMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('cheque_no')) {
      context.handle(_chequeNoMeta,
          chequeNo.isAcceptableOrUnknown(data['cheque_no']!, _chequeNoMeta));
    }
    if (data.containsKey('from_id')) {
      context.handle(_fromIdMeta,
          fromId.isAcceptableOrUnknown(data['from_id']!, _fromIdMeta));
    } else if (isInserting) {
      context.missing(_fromIdMeta);
    }
    if (data.containsKey('to_id')) {
      context.handle(
          _toIdMeta, toId.isAcceptableOrUnknown(data['to_id']!, _toIdMeta));
    } else if (isInserting) {
      context.missing(_toIdMeta);
    }
    if (data.containsKey('site_id')) {
      context.handle(_siteIdMeta,
          siteId.isAcceptableOrUnknown(data['site_id']!, _siteIdMeta));
    } else if (isInserting) {
      context.missing(_siteIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      chequeNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cheque_no']),
      fromId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_id'])!,
      toId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_id'])!,
      siteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}site_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String remarks;
  final double amount;
  final String? chequeNo;
  final int fromId;
  final int toId;
  final int siteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Transaction(
      {required this.id,
      required this.remarks,
      required this.amount,
      this.chequeNo,
      required this.fromId,
      required this.toId,
      required this.siteId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['remarks'] = Variable<String>(remarks);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || chequeNo != null) {
      map['cheque_no'] = Variable<String>(chequeNo);
    }
    map['from_id'] = Variable<int>(fromId);
    map['to_id'] = Variable<int>(toId);
    map['site_id'] = Variable<int>(siteId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      remarks: Value(remarks),
      amount: Value(amount),
      chequeNo: chequeNo == null && nullToAbsent
          ? const Value.absent()
          : Value(chequeNo),
      fromId: Value(fromId),
      toId: Value(toId),
      siteId: Value(siteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      remarks: serializer.fromJson<String>(json['remarks']),
      amount: serializer.fromJson<double>(json['amount']),
      chequeNo: serializer.fromJson<String?>(json['chequeNo']),
      fromId: serializer.fromJson<int>(json['fromId']),
      toId: serializer.fromJson<int>(json['toId']),
      siteId: serializer.fromJson<int>(json['siteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remarks': serializer.toJson<String>(remarks),
      'amount': serializer.toJson<double>(amount),
      'chequeNo': serializer.toJson<String?>(chequeNo),
      'fromId': serializer.toJson<int>(fromId),
      'toId': serializer.toJson<int>(toId),
      'siteId': serializer.toJson<int>(siteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Transaction copyWith(
          {int? id,
          String? remarks,
          double? amount,
          Value<String?> chequeNo = const Value.absent(),
          int? fromId,
          int? toId,
          int? siteId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Transaction(
        id: id ?? this.id,
        remarks: remarks ?? this.remarks,
        amount: amount ?? this.amount,
        chequeNo: chequeNo.present ? chequeNo.value : this.chequeNo,
        fromId: fromId ?? this.fromId,
        toId: toId ?? this.toId,
        siteId: siteId ?? this.siteId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      amount: data.amount.present ? data.amount.value : this.amount,
      chequeNo: data.chequeNo.present ? data.chequeNo.value : this.chequeNo,
      fromId: data.fromId.present ? data.fromId.value : this.fromId,
      toId: data.toId.present ? data.toId.value : this.toId,
      siteId: data.siteId.present ? data.siteId.value : this.siteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('remarks: $remarks, ')
          ..write('amount: $amount, ')
          ..write('chequeNo: $chequeNo, ')
          ..write('fromId: $fromId, ')
          ..write('toId: $toId, ')
          ..write('siteId: $siteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remarks, amount, chequeNo, fromId, toId,
      siteId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.remarks == this.remarks &&
          other.amount == this.amount &&
          other.chequeNo == this.chequeNo &&
          other.fromId == this.fromId &&
          other.toId == this.toId &&
          other.siteId == this.siteId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> remarks;
  final Value<double> amount;
  final Value<String?> chequeNo;
  final Value<int> fromId;
  final Value<int> toId;
  final Value<int> siteId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.remarks = const Value.absent(),
    this.amount = const Value.absent(),
    this.chequeNo = const Value.absent(),
    this.fromId = const Value.absent(),
    this.toId = const Value.absent(),
    this.siteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String remarks,
    required double amount,
    this.chequeNo = const Value.absent(),
    required int fromId,
    required int toId,
    required int siteId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : remarks = Value(remarks),
        amount = Value(amount),
        fromId = Value(fromId),
        toId = Value(toId),
        siteId = Value(siteId);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? remarks,
    Expression<double>? amount,
    Expression<String>? chequeNo,
    Expression<int>? fromId,
    Expression<int>? toId,
    Expression<int>? siteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remarks != null) 'remarks': remarks,
      if (amount != null) 'amount': amount,
      if (chequeNo != null) 'cheque_no': chequeNo,
      if (fromId != null) 'from_id': fromId,
      if (toId != null) 'to_id': toId,
      if (siteId != null) 'site_id': siteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? remarks,
      Value<double>? amount,
      Value<String?>? chequeNo,
      Value<int>? fromId,
      Value<int>? toId,
      Value<int>? siteId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      remarks: remarks ?? this.remarks,
      amount: amount ?? this.amount,
      chequeNo: chequeNo ?? this.chequeNo,
      fromId: fromId ?? this.fromId,
      toId: toId ?? this.toId,
      siteId: siteId ?? this.siteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (chequeNo.present) {
      map['cheque_no'] = Variable<String>(chequeNo.value);
    }
    if (fromId.present) {
      map['from_id'] = Variable<int>(fromId.value);
    }
    if (toId.present) {
      map['to_id'] = Variable<int>(toId.value);
    }
    if (siteId.present) {
      map['site_id'] = Variable<int>(siteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('remarks: $remarks, ')
          ..write('amount: $amount, ')
          ..write('chequeNo: $chequeNo, ')
          ..write('fromId: $fromId, ')
          ..write('toId: $toId, ')
          ..write('siteId: $siteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FirmsTable firms = $FirmsTable(this);
  late final $SitesTable sites = $SitesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $FlatsTable flats = $FlatsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $SubCategoriesTable subCategories = $SubCategoriesTable(this);
  late final $BankAccountsTable bankAccounts = $BankAccountsTable(this);
  late final $EntityPaymentMethodsTable entityPaymentMethods =
      $EntityPaymentMethodsTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        firms,
        sites,
        users,
        flats,
        categories,
        subCategories,
        bankAccounts,
        entityPaymentMethods,
        partners,
        transactions
      ];
}

typedef $$FirmsTableCreateCompanionBuilder = FirmsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> address,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$FirmsTableUpdateCompanionBuilder = FirmsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> address,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$FirmsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FirmsTable,
    Firm,
    $$FirmsTableFilterComposer,
    $$FirmsTableOrderingComposer,
    $$FirmsTableCreateCompanionBuilder,
    $$FirmsTableUpdateCompanionBuilder> {
  $$FirmsTableTableManager(_$AppDatabase db, $FirmsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FirmsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FirmsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FirmsCompanion(
            id: id,
            name: name,
            address: address,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> address = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FirmsCompanion.insert(
            id: id,
            name: name,
            address: address,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$FirmsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FirmsTable> {
  $$FirmsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter sitesRefs(
      ComposableFilter Function($$SitesTableFilterComposer f) f) {
    final $$SitesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.firmId,
        builder: (joinBuilder, parentComposers) => $$SitesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$FirmsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FirmsTable> {
  $$FirmsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SitesTableCreateCompanionBuilder = SitesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> address,
  required int firmId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SitesTableUpdateCompanionBuilder = SitesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> address,
  Value<int> firmId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SitesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SitesTable,
    Site,
    $$SitesTableFilterComposer,
    $$SitesTableOrderingComposer,
    $$SitesTableCreateCompanionBuilder,
    $$SitesTableUpdateCompanionBuilder> {
  $$SitesTableTableManager(_$AppDatabase db, $SitesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SitesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SitesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<int> firmId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SitesCompanion(
            id: id,
            name: name,
            address: address,
            firmId: firmId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> address = const Value.absent(),
            required int firmId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SitesCompanion.insert(
            id: id,
            name: name,
            address: address,
            firmId: firmId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$SitesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SitesTable> {
  $$SitesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$FirmsTableFilterComposer get firmId {
    final $$FirmsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firmId,
        referencedTable: $state.db.firms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$FirmsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.firms, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter flatsRefs(
      ComposableFilter Function($$FlatsTableFilterComposer f) f) {
    final $$FlatsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.flats,
        getReferencedColumn: (t) => t.siteId,
        builder: (joinBuilder, parentComposers) => $$FlatsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.flats, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter partnersRefs(
      ComposableFilter Function($$PartnersTableFilterComposer f) f) {
    final $$PartnersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.partners,
        getReferencedColumn: (t) => t.siteId,
        builder: (joinBuilder, parentComposers) =>
            $$PartnersTableFilterComposer(ComposerState(
                $state.db, $state.db.partners, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter transactionsRefs(
      ComposableFilter Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.siteId,
        builder: (joinBuilder, parentComposers) =>
            $$TransactionsTableFilterComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SitesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SitesTable> {
  $$SitesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$FirmsTableOrderingComposer get firmId {
    final $$FirmsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firmId,
        referencedTable: $state.db.firms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$FirmsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.firms, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required int subCategory,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> subCategory,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> subCategory = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            subCategory: subCategory,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int subCategory,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            subCategory: subCategory,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter flatsRefs(
      ComposableFilter Function($$FlatsTableFilterComposer f) f) {
    final $$FlatsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.flats,
        getReferencedColumn: (t) => t.buyerId,
        builder: (joinBuilder, parentComposers) => $$FlatsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.flats, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter partnersRefs(
      ComposableFilter Function($$PartnersTableFilterComposer f) f) {
    final $$PartnersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.partners,
        getReferencedColumn: (t) => t.builderId,
        builder: (joinBuilder, parentComposers) =>
            $$PartnersTableFilterComposer(ComposerState(
                $state.db, $state.db.partners, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FlatsTableCreateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  required String name,
  required int area,
  required String type,
  required int rate,
  Value<bool> isSold,
  required int siteId,
  Value<int?> buyerId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$FlatsTableUpdateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> area,
  Value<String> type,
  Value<int> rate,
  Value<bool> isSold,
  Value<int> siteId,
  Value<int?> buyerId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$FlatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FlatsTable,
    Flat,
    $$FlatsTableFilterComposer,
    $$FlatsTableOrderingComposer,
    $$FlatsTableCreateCompanionBuilder,
    $$FlatsTableUpdateCompanionBuilder> {
  $$FlatsTableTableManager(_$AppDatabase db, $FlatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FlatsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FlatsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> area = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> rate = const Value.absent(),
            Value<bool> isSold = const Value.absent(),
            Value<int> siteId = const Value.absent(),
            Value<int?> buyerId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FlatsCompanion(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
            siteId: siteId,
            buyerId: buyerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int area,
            required String type,
            required int rate,
            Value<bool> isSold = const Value.absent(),
            required int siteId,
            Value<int?> buyerId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FlatsCompanion.insert(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
            siteId: siteId,
            buyerId: buyerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$FlatsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FlatsTable> {
  $$FlatsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get area => $state.composableBuilder(
      column: $state.table.area,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSold => $state.composableBuilder(
      column: $state.table.isSold,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SitesTableFilterComposer get siteId {
    final $$SitesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get buyerId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FlatsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FlatsTable> {
  $$FlatsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get area => $state.composableBuilder(
      column: $state.table.area,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSold => $state.composableBuilder(
      column: $state.table.isSold,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SitesTableOrderingComposer get siteId {
    final $$SitesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get buyerId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.buyerId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter subCategoriesRefs(
      ComposableFilter Function($$SubCategoriesTableFilterComposer f) f) {
    final $$SubCategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.subCategories,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) =>
            $$SubCategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.subCategories, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SubCategoriesTableCreateCompanionBuilder = SubCategoriesCompanion
    Function({
  Value<int> id,
  required String name,
  required int categoryId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SubCategoriesTableUpdateCompanionBuilder = SubCategoriesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> categoryId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SubCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubCategoriesTable,
    SubCategory,
    $$SubCategoriesTableFilterComposer,
    $$SubCategoriesTableOrderingComposer,
    $$SubCategoriesTableCreateCompanionBuilder,
    $$SubCategoriesTableUpdateCompanionBuilder> {
  $$SubCategoriesTableTableManager(_$AppDatabase db, $SubCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SubCategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SubCategoriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SubCategoriesCompanion(
            id: id,
            name: name,
            categoryId: categoryId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int categoryId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SubCategoriesCompanion.insert(
            id: id,
            name: name,
            categoryId: categoryId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$SubCategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SubCategoriesTable> {
  $$SubCategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SubCategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SubCategoriesTable> {
  $$SubCategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoriesTableOrderingComposer(ComposerState($state.db,
                $state.db.categories, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$BankAccountsTableCreateCompanionBuilder = BankAccountsCompanion
    Function({
  Value<int> id,
  required String accountNumber,
  required int entityId,
  required String entityType,
  required String bankName,
  required String ifsc,
  required String accountHolder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$BankAccountsTableUpdateCompanionBuilder = BankAccountsCompanion
    Function({
  Value<int> id,
  Value<String> accountNumber,
  Value<int> entityId,
  Value<String> entityType,
  Value<String> bankName,
  Value<String> ifsc,
  Value<String> accountHolder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$BankAccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankAccountsTable,
    BankAccount,
    $$BankAccountsTableFilterComposer,
    $$BankAccountsTableOrderingComposer,
    $$BankAccountsTableCreateCompanionBuilder,
    $$BankAccountsTableUpdateCompanionBuilder> {
  $$BankAccountsTableTableManager(_$AppDatabase db, $BankAccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BankAccountsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BankAccountsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> accountNumber = const Value.absent(),
            Value<int> entityId = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> bankName = const Value.absent(),
            Value<String> ifsc = const Value.absent(),
            Value<String> accountHolder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BankAccountsCompanion(
            id: id,
            accountNumber: accountNumber,
            entityId: entityId,
            entityType: entityType,
            bankName: bankName,
            ifsc: ifsc,
            accountHolder: accountHolder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String accountNumber,
            required int entityId,
            required String entityType,
            required String bankName,
            required String ifsc,
            required String accountHolder,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BankAccountsCompanion.insert(
            id: id,
            accountNumber: accountNumber,
            entityId: entityId,
            entityType: entityType,
            bankName: bankName,
            ifsc: ifsc,
            accountHolder: accountHolder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$BankAccountsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BankAccountsTable> {
  $$BankAccountsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get entityId => $state.composableBuilder(
      column: $state.table.entityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get entityType => $state.composableBuilder(
      column: $state.table.entityType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bankName => $state.composableBuilder(
      column: $state.table.bankName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ifsc => $state.composableBuilder(
      column: $state.table.ifsc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accountHolder => $state.composableBuilder(
      column: $state.table.accountHolder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BankAccountsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BankAccountsTable> {
  $$BankAccountsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accountNumber => $state.composableBuilder(
      column: $state.table.accountNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get entityId => $state.composableBuilder(
      column: $state.table.entityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get entityType => $state.composableBuilder(
      column: $state.table.entityType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bankName => $state.composableBuilder(
      column: $state.table.bankName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ifsc => $state.composableBuilder(
      column: $state.table.ifsc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accountHolder => $state.composableBuilder(
      column: $state.table.accountHolder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EntityPaymentMethodsTableCreateCompanionBuilder
    = EntityPaymentMethodsCompanion Function({
  Value<int> id,
  required int entityId,
  required String entityType,
  Value<int?> bankAccountId,
  required String paymentMethod,
});
typedef $$EntityPaymentMethodsTableUpdateCompanionBuilder
    = EntityPaymentMethodsCompanion Function({
  Value<int> id,
  Value<int> entityId,
  Value<String> entityType,
  Value<int?> bankAccountId,
  Value<String> paymentMethod,
});

class $$EntityPaymentMethodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntityPaymentMethodsTable,
    EntityPaymentMethod,
    $$EntityPaymentMethodsTableFilterComposer,
    $$EntityPaymentMethodsTableOrderingComposer,
    $$EntityPaymentMethodsTableCreateCompanionBuilder,
    $$EntityPaymentMethodsTableUpdateCompanionBuilder> {
  $$EntityPaymentMethodsTableTableManager(
      _$AppDatabase db, $EntityPaymentMethodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$EntityPaymentMethodsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$EntityPaymentMethodsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> entityId = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<int?> bankAccountId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
          }) =>
              EntityPaymentMethodsCompanion(
            id: id,
            entityId: entityId,
            entityType: entityType,
            bankAccountId: bankAccountId,
            paymentMethod: paymentMethod,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int entityId,
            required String entityType,
            Value<int?> bankAccountId = const Value.absent(),
            required String paymentMethod,
          }) =>
              EntityPaymentMethodsCompanion.insert(
            id: id,
            entityId: entityId,
            entityType: entityType,
            bankAccountId: bankAccountId,
            paymentMethod: paymentMethod,
          ),
        ));
}

class $$EntityPaymentMethodsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EntityPaymentMethodsTable> {
  $$EntityPaymentMethodsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get entityId => $state.composableBuilder(
      column: $state.table.entityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get entityType => $state.composableBuilder(
      column: $state.table.entityType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bankAccountId => $state.composableBuilder(
      column: $state.table.bankAccountId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get paymentMethod => $state.composableBuilder(
      column: $state.table.paymentMethod,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EntityPaymentMethodsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EntityPaymentMethodsTable> {
  $$EntityPaymentMethodsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get entityId => $state.composableBuilder(
      column: $state.table.entityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get entityType => $state.composableBuilder(
      column: $state.table.entityType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bankAccountId => $state.composableBuilder(
      column: $state.table.bankAccountId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get paymentMethod => $state.composableBuilder(
      column: $state.table.paymentMethod,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PartnersTableCreateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  required int builderId,
  required int siteId,
  required int share,
});
typedef $$PartnersTableUpdateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  Value<int> builderId,
  Value<int> siteId,
  Value<int> share,
});

class $$PartnersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PartnersTable,
    Partner,
    $$PartnersTableFilterComposer,
    $$PartnersTableOrderingComposer,
    $$PartnersTableCreateCompanionBuilder,
    $$PartnersTableUpdateCompanionBuilder> {
  $$PartnersTableTableManager(_$AppDatabase db, $PartnersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PartnersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PartnersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> builderId = const Value.absent(),
            Value<int> siteId = const Value.absent(),
            Value<int> share = const Value.absent(),
          }) =>
              PartnersCompanion(
            id: id,
            builderId: builderId,
            siteId: siteId,
            share: share,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int builderId,
            required int siteId,
            required int share,
          }) =>
              PartnersCompanion.insert(
            id: id,
            builderId: builderId,
            siteId: siteId,
            share: share,
          ),
        ));
}

class $$PartnersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get share => $state.composableBuilder(
      column: $state.table.share,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get builderId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.builderId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$SitesTableFilterComposer get siteId {
    final $$SitesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PartnersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get share => $state.composableBuilder(
      column: $state.table.share,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get builderId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.builderId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }

  $$SitesTableOrderingComposer get siteId {
    final $$SitesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required String remarks,
  required double amount,
  Value<String?> chequeNo,
  required int fromId,
  required int toId,
  required int siteId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String> remarks,
  Value<double> amount,
  Value<String?> chequeNo,
  Value<int> fromId,
  Value<int> toId,
  Value<int> siteId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> remarks = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> chequeNo = const Value.absent(),
            Value<int> fromId = const Value.absent(),
            Value<int> toId = const Value.absent(),
            Value<int> siteId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            remarks: remarks,
            amount: amount,
            chequeNo: chequeNo,
            fromId: fromId,
            toId: toId,
            siteId: siteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String remarks,
            required double amount,
            Value<String?> chequeNo = const Value.absent(),
            required int fromId,
            required int toId,
            required int siteId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            remarks: remarks,
            amount: amount,
            chequeNo: chequeNo,
            fromId: fromId,
            toId: toId,
            siteId: siteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$TransactionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remarks => $state.composableBuilder(
      column: $state.table.remarks,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chequeNo => $state.composableBuilder(
      column: $state.table.chequeNo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fromId => $state.composableBuilder(
      column: $state.table.fromId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get toId => $state.composableBuilder(
      column: $state.table.toId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SitesTableFilterComposer get siteId {
    final $$SitesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remarks => $state.composableBuilder(
      column: $state.table.remarks,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chequeNo => $state.composableBuilder(
      column: $state.table.chequeNo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fromId => $state.composableBuilder(
      column: $state.table.fromId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get toId => $state.composableBuilder(
      column: $state.table.toId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SitesTableOrderingComposer get siteId {
    final $$SitesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.siteId,
        referencedTable: $state.db.sites,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SitesTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.sites, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FirmsTableTableManager get firms =>
      $$FirmsTableTableManager(_db, _db.firms);
  $$SitesTableTableManager get sites =>
      $$SitesTableTableManager(_db, _db.sites);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$FlatsTableTableManager get flats =>
      $$FlatsTableTableManager(_db, _db.flats);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$SubCategoriesTableTableManager get subCategories =>
      $$SubCategoriesTableTableManager(_db, _db.subCategories);
  $$BankAccountsTableTableManager get bankAccounts =>
      $$BankAccountsTableTableManager(_db, _db.bankAccounts);
  $$EntityPaymentMethodsTableTableManager get entityPaymentMethods =>
      $$EntityPaymentMethodsTableTableManager(_db, _db.entityPaymentMethods);
  $$PartnersTableTableManager get partners =>
      $$PartnersTableTableManager(_db, _db.partners);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
