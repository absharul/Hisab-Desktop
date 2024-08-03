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
      'address', aliasedName, false,
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
    } else if (isInserting) {
      context.missing(_addressMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
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
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Firm(
      {required this.id,
      required this.name,
      required this.address,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FirmsCompanion toCompanion(bool nullToAbsent) {
    return FirmsCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
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
      address: serializer.fromJson<String>(json['address']),
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
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Firm copyWith(
          {int? id,
          String? name,
          String? address,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Firm(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
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
  final Value<String> address;
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
    required String address,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        address = Value(address);
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
      Value<String>? address,
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
      'address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _firmIdMeta = const VerificationMeta('firmId');
  @override
  late final GeneratedColumn<int> firmId = GeneratedColumn<int>(
      'firm_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES firms(id)');
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
    } else if (isInserting) {
      context.missing(_addressMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
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
  final String address;
  final int firmId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Site(
      {required this.id,
      required this.name,
      required this.address,
      required this.firmId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['firm_id'] = Variable<int>(firmId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
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
      address: serializer.fromJson<String>(json['address']),
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
      'address': serializer.toJson<String>(address),
      'firmId': serializer.toJson<int>(firmId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Site copyWith(
          {int? id,
          String? name,
          String? address,
          int? firmId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Site(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
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
  final Value<String> address;
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
    required String address,
    required int firmId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        address = Value(address),
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
      Value<String>? address,
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
      defaultValue: Constant(false));
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'site_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES sites(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, area, type, rate, isSold, siteId];
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
  const Flat(
      {required this.id,
      required this.name,
      required this.area,
      required this.type,
      required this.rate,
      required this.isSold,
      required this.siteId});
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
    };
  }

  Flat copyWith(
          {int? id,
          String? name,
          int? area,
          String? type,
          int? rate,
          bool? isSold,
          int? siteId}) =>
      Flat(
        id: id ?? this.id,
        name: name ?? this.name,
        area: area ?? this.area,
        type: type ?? this.type,
        rate: rate ?? this.rate,
        isSold: isSold ?? this.isSold,
        siteId: siteId ?? this.siteId,
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
          ..write('siteId: $siteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, area, type, rate, isSold, siteId);
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
          other.siteId == this.siteId);
}

class FlatsCompanion extends UpdateCompanion<Flat> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> area;
  final Value<String> type;
  final Value<int> rate;
  final Value<bool> isSold;
  final Value<int> siteId;
  const FlatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.area = const Value.absent(),
    this.type = const Value.absent(),
    this.rate = const Value.absent(),
    this.isSold = const Value.absent(),
    this.siteId = const Value.absent(),
  });
  FlatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int area,
    required String type,
    required int rate,
    this.isSold = const Value.absent(),
    required int siteId,
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (area != null) 'area': area,
      if (type != null) 'type': type,
      if (rate != null) 'rate': rate,
      if (isSold != null) 'is_sold': isSold,
      if (siteId != null) 'site_id': siteId,
    });
  }

  FlatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? area,
      Value<String>? type,
      Value<int>? rate,
      Value<bool>? isSold,
      Value<int>? siteId}) {
    return FlatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      isSold: isSold ?? this.isSold,
      siteId: siteId ?? this.siteId,
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
          ..write('siteId: $siteId')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _siteMeta = const VerificationMeta('site');
  @override
  late final GeneratedColumn<String> site = GeneratedColumn<String>(
      'site', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, site, date];
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('site')) {
      context.handle(
          _siteMeta, site.isAcceptableOrUnknown(data['site']!, _siteMeta));
    } else if (isInserting) {
      context.missing(_siteMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
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
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      site: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $PartnersTable createAlias(String alias) {
    return $PartnersTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  final int id;
  final String name;
  final String site;
  final DateTime date;
  const Partner(
      {required this.id,
      required this.name,
      required this.site,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['site'] = Variable<String>(site);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  PartnersCompanion toCompanion(bool nullToAbsent) {
    return PartnersCompanion(
      id: Value(id),
      name: Value(name),
      site: Value(site),
      date: Value(date),
    );
  }

  factory Partner.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      site: serializer.fromJson<String>(json['site']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'site': serializer.toJson<String>(site),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Partner copyWith({int? id, String? name, String? site, DateTime? date}) =>
      Partner(
        id: id ?? this.id,
        name: name ?? this.name,
        site: site ?? this.site,
        date: date ?? this.date,
      );
  Partner copyWithCompanion(PartnersCompanion data) {
    return Partner(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      site: data.site.present ? data.site.value : this.site,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('site: $site, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, site, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.id == this.id &&
          other.name == this.name &&
          other.site == this.site &&
          other.date == this.date);
}

class PartnersCompanion extends UpdateCompanion<Partner> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> site;
  final Value<DateTime> date;
  const PartnersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.site = const Value.absent(),
    this.date = const Value.absent(),
  });
  PartnersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String site,
    required DateTime date,
  })  : name = Value(name),
        site = Value(site),
        date = Value(date);
  static Insertable<Partner> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? site,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (site != null) 'site': site,
      if (date != null) 'date': date,
    });
  }

  PartnersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? site,
      Value<DateTime>? date}) {
    return PartnersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      site: site ?? this.site,
      date: date ?? this.date,
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
    if (site.present) {
      map['site'] = Variable<String>(site.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('site: $site, ')
          ..write('date: $date')
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
      'entity', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _transactionMethodMeta =
      const VerificationMeta('transactionMethod');
  @override
  late final GeneratedColumn<String> transactionMethod =
      GeneratedColumn<String>('transaction_method', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 20),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chequeNoMeta =
      const VerificationMeta('chequeNo');
  @override
  late final GeneratedColumn<String> chequeNo = GeneratedColumn<String>(
      'cheque_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, entity, transactionMethod, amount, chequeNo];
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
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('entity')) {
      context.handle(_entityMeta,
          entity.isAcceptableOrUnknown(data['entity']!, _entityMeta));
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('transaction_method')) {
      context.handle(
          _transactionMethodMeta,
          transactionMethod.isAcceptableOrUnknown(
              data['transaction_method']!, _transactionMethodMeta));
    } else if (isInserting) {
      context.missing(_transactionMethodMeta);
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
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      entity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity'])!,
      transactionMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_method'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      chequeNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cheque_no']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final DateTime date;
  final String entity;
  final String transactionMethod;
  final int amount;
  final String? chequeNo;
  const Transaction(
      {required this.id,
      required this.date,
      required this.entity,
      required this.transactionMethod,
      required this.amount,
      this.chequeNo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['entity'] = Variable<String>(entity);
    map['transaction_method'] = Variable<String>(transactionMethod);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || chequeNo != null) {
      map['cheque_no'] = Variable<String>(chequeNo);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      date: Value(date),
      entity: Value(entity),
      transactionMethod: Value(transactionMethod),
      amount: Value(amount),
      chequeNo: chequeNo == null && nullToAbsent
          ? const Value.absent()
          : Value(chequeNo),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      entity: serializer.fromJson<String>(json['entity']),
      transactionMethod: serializer.fromJson<String>(json['transactionMethod']),
      amount: serializer.fromJson<int>(json['amount']),
      chequeNo: serializer.fromJson<String?>(json['chequeNo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'entity': serializer.toJson<String>(entity),
      'transactionMethod': serializer.toJson<String>(transactionMethod),
      'amount': serializer.toJson<int>(amount),
      'chequeNo': serializer.toJson<String?>(chequeNo),
    };
  }

  Transaction copyWith(
          {int? id,
          DateTime? date,
          String? entity,
          String? transactionMethod,
          int? amount,
          Value<String?> chequeNo = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        date: date ?? this.date,
        entity: entity ?? this.entity,
        transactionMethod: transactionMethod ?? this.transactionMethod,
        amount: amount ?? this.amount,
        chequeNo: chequeNo.present ? chequeNo.value : this.chequeNo,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      entity: data.entity.present ? data.entity.value : this.entity,
      transactionMethod: data.transactionMethod.present
          ? data.transactionMethod.value
          : this.transactionMethod,
      amount: data.amount.present ? data.amount.value : this.amount,
      chequeNo: data.chequeNo.present ? data.chequeNo.value : this.chequeNo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('entity: $entity, ')
          ..write('transactionMethod: $transactionMethod, ')
          ..write('amount: $amount, ')
          ..write('chequeNo: $chequeNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, entity, transactionMethod, amount, chequeNo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.date == this.date &&
          other.entity == this.entity &&
          other.transactionMethod == this.transactionMethod &&
          other.amount == this.amount &&
          other.chequeNo == this.chequeNo);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> entity;
  final Value<String> transactionMethod;
  final Value<int> amount;
  final Value<String?> chequeNo;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.entity = const Value.absent(),
    this.transactionMethod = const Value.absent(),
    this.amount = const Value.absent(),
    this.chequeNo = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String entity,
    required String transactionMethod,
    required int amount,
    this.chequeNo = const Value.absent(),
  })  : date = Value(date),
        entity = Value(entity),
        transactionMethod = Value(transactionMethod),
        amount = Value(amount);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? entity,
    Expression<String>? transactionMethod,
    Expression<int>? amount,
    Expression<String>? chequeNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (entity != null) 'entity': entity,
      if (transactionMethod != null) 'transaction_method': transactionMethod,
      if (amount != null) 'amount': amount,
      if (chequeNo != null) 'cheque_no': chequeNo,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? entity,
      Value<String>? transactionMethod,
      Value<int>? amount,
      Value<String?>? chequeNo}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      entity: entity ?? this.entity,
      transactionMethod: transactionMethod ?? this.transactionMethod,
      amount: amount ?? this.amount,
      chequeNo: chequeNo ?? this.chequeNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (transactionMethod.present) {
      map['transaction_method'] = Variable<String>(transactionMethod.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (chequeNo.present) {
      map['cheque_no'] = Variable<String>(chequeNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('entity: $entity, ')
          ..write('transactionMethod: $transactionMethod, ')
          ..write('amount: $amount, ')
          ..write('chequeNo: $chequeNo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FirmsTable firms = $FirmsTable(this);
  late final $SitesTable sites = $SitesTable(this);
  late final $FlatsTable flats = $FlatsTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [firms, sites, flats, partners, transactions];
}

typedef $$FirmsTableCreateCompanionBuilder = FirmsCompanion Function({
  Value<int> id,
  required String name,
  required String address,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$FirmsTableUpdateCompanionBuilder = FirmsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> address,
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
            Value<String> address = const Value.absent(),
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
            required String address,
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
  required String address,
  required int firmId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SitesTableUpdateCompanionBuilder = SitesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> address,
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
            Value<String> address = const Value.absent(),
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
            required String address,
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

typedef $$FlatsTableCreateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  required String name,
  required int area,
  required String type,
  required int rate,
  Value<bool> isSold,
  required int siteId,
});
typedef $$FlatsTableUpdateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> area,
  Value<String> type,
  Value<int> rate,
  Value<bool> isSold,
  Value<int> siteId,
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
          }) =>
              FlatsCompanion(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
            siteId: siteId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int area,
            required String type,
            required int rate,
            Value<bool> isSold = const Value.absent(),
            required int siteId,
          }) =>
              FlatsCompanion.insert(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
            siteId: siteId,
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

typedef $$PartnersTableCreateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  required String name,
  required String site,
  required DateTime date,
});
typedef $$PartnersTableUpdateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> site,
  Value<DateTime> date,
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
            Value<String> name = const Value.absent(),
            Value<String> site = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              PartnersCompanion(
            id: id,
            name: name,
            site: site,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String site,
            required DateTime date,
          }) =>
              PartnersCompanion.insert(
            id: id,
            name: name,
            site: site,
            date: date,
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

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get site => $state.composableBuilder(
      column: $state.table.site,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PartnersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get site => $state.composableBuilder(
      column: $state.table.site,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required DateTime date,
  required String entity,
  required String transactionMethod,
  required int amount,
  Value<String?> chequeNo,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<String> entity,
  Value<String> transactionMethod,
  Value<int> amount,
  Value<String?> chequeNo,
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
            Value<DateTime> date = const Value.absent(),
            Value<String> entity = const Value.absent(),
            Value<String> transactionMethod = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String?> chequeNo = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            date: date,
            entity: entity,
            transactionMethod: transactionMethod,
            amount: amount,
            chequeNo: chequeNo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            required String entity,
            required String transactionMethod,
            required int amount,
            Value<String?> chequeNo = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            date: date,
            entity: entity,
            transactionMethod: transactionMethod,
            amount: amount,
            chequeNo: chequeNo,
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

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get entity => $state.composableBuilder(
      column: $state.table.entity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get transactionMethod => $state.composableBuilder(
      column: $state.table.transactionMethod,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chequeNo => $state.composableBuilder(
      column: $state.table.chequeNo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransactionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get entity => $state.composableBuilder(
      column: $state.table.entity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get transactionMethod => $state.composableBuilder(
      column: $state.table.transactionMethod,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chequeNo => $state.composableBuilder(
      column: $state.table.chequeNo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FirmsTableTableManager get firms =>
      $$FirmsTableTableManager(_db, _db.firms);
  $$SitesTableTableManager get sites =>
      $$SitesTableTableManager(_db, _db.sites);
  $$FlatsTableTableManager get flats =>
      $$FlatsTableTableManager(_db, _db.flats);
  $$PartnersTableTableManager get partners =>
      $$PartnersTableTableManager(_db, _db.partners);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
