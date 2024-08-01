// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
  @override
  List<GeneratedColumn> get $columns => [id, name, area, type, rate, isSold];
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
  const Flat(
      {required this.id,
      required this.name,
      required this.area,
      required this.type,
      required this.rate,
      required this.isSold});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['area'] = Variable<int>(area);
    map['type'] = Variable<String>(type);
    map['rate'] = Variable<int>(rate);
    map['is_sold'] = Variable<bool>(isSold);
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
    };
  }

  Flat copyWith(
          {int? id,
          String? name,
          int? area,
          String? type,
          int? rate,
          bool? isSold}) =>
      Flat(
        id: id ?? this.id,
        name: name ?? this.name,
        area: area ?? this.area,
        type: type ?? this.type,
        rate: rate ?? this.rate,
        isSold: isSold ?? this.isSold,
      );
  Flat copyWithCompanion(FlatsCompanion data) {
    return Flat(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      area: data.area.present ? data.area.value : this.area,
      type: data.type.present ? data.type.value : this.type,
      rate: data.rate.present ? data.rate.value : this.rate,
      isSold: data.isSold.present ? data.isSold.value : this.isSold,
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
          ..write('isSold: $isSold')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, area, type, rate, isSold);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flat &&
          other.id == this.id &&
          other.name == this.name &&
          other.area == this.area &&
          other.type == this.type &&
          other.rate == this.rate &&
          other.isSold == this.isSold);
}

class FlatsCompanion extends UpdateCompanion<Flat> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> area;
  final Value<String> type;
  final Value<int> rate;
  final Value<bool> isSold;
  const FlatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.area = const Value.absent(),
    this.type = const Value.absent(),
    this.rate = const Value.absent(),
    this.isSold = const Value.absent(),
  });
  FlatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int area,
    required String type,
    required int rate,
    this.isSold = const Value.absent(),
  })  : name = Value(name),
        area = Value(area),
        type = Value(type),
        rate = Value(rate);
  static Insertable<Flat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? area,
    Expression<String>? type,
    Expression<int>? rate,
    Expression<bool>? isSold,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (area != null) 'area': area,
      if (type != null) 'type': type,
      if (rate != null) 'rate': rate,
      if (isSold != null) 'is_sold': isSold,
    });
  }

  FlatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? area,
      Value<String>? type,
      Value<int>? rate,
      Value<bool>? isSold}) {
    return FlatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      isSold: isSold ?? this.isSold,
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
          ..write('isSold: $isSold')
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
  late final $FlatsTable flats = $FlatsTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [flats, partners, transactions];
}

typedef $$FlatsTableCreateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  required String name,
  required int area,
  required String type,
  required int rate,
  Value<bool> isSold,
});
typedef $$FlatsTableUpdateCompanionBuilder = FlatsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> area,
  Value<String> type,
  Value<int> rate,
  Value<bool> isSold,
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
          }) =>
              FlatsCompanion(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int area,
            required String type,
            required int rate,
            Value<bool> isSold = const Value.absent(),
          }) =>
              FlatsCompanion.insert(
            id: id,
            name: name,
            area: area,
            type: type,
            rate: rate,
            isSold: isSold,
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
  $$FlatsTableTableManager get flats =>
      $$FlatsTableTableManager(_db, _db.flats);
  $$PartnersTableTableManager get partners =>
      $$PartnersTableTableManager(_db, _db.partners);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
