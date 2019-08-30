// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..dirty = json['dirty'] as bool
    ..id = json['id'] as int
    ..country = json['country'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dirty', instance.dirty);
  writeNotNull('id', instance.id);
  writeNotNull('country', instance.country);
  return val;
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AddresssDaoMixin on DatabaseAccessor<VDDatabase> {
  Addresss _addresss;
  Addresss get addresss => _addresss ??= Addresss(db);
  Future upsert(Address instance) {
    return transaction((_) async {
      await into(addresss).insert(instance, orReplace: true);
    });
  }

  Future<List<Address>> loadAll(
      {Expression<bool, BoolType> where(Addresss table),
      int limit,
      int offset,
      List<OrderClauseGenerator<Addresss>> orderBy}) {
    final statement = select(addresss);
    if (where != null) {
      statement.where(where);
    }
    if (limit != null) {
      statement.limit(limit, offset: offset);
    }
    if (orderBy != null) {
      statement.orderBy(orderBy);
    }
    final joins = addresss.getJoins();
    return joins.length == 0
        ? statement.get()
        : statement.join(joins).get().then((rows) {
            return rows.map((row) => row.readTable(addresss)).toList();
          });
  }

  Future<Address> load(key) async {
    final list = await (select(addresss)
          ..where((table) => table.primaryKey.first.equals(key)))
        .get();
    return list.length > 0 ? list.first : null;
  }

  List<TableInfo> get tables => [addresss];
}
AddresssCompanion _$createCompanion(Address instance, bool nullToAbsent) {
  return AddresssCompanion(
    id: instance.id == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.id),
    country: instance.country == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.country),
    dirty: instance.dirty == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.dirty),
  );
}

class AddresssCompanion extends UpdateCompanion<Address> {
  final Value<int> id;
  final Value<String> country;
  final Value<bool> dirty;
  const AddresssCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.dirty = const Value.absent(),
  });
  AddresssCompanion copyWith(
      {Value<int> id, Value<String> country, Value<bool> dirty}) {
    return AddresssCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
      dirty: dirty ?? this.dirty,
    );
  }
}

class Addresss extends Table with TableInfo<Addresss, Address> {
  final GeneratedDatabase _db;
  final String _alias;
  Addresss(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  GeneratedBoolColumn _dirty;
  GeneratedBoolColumn get dirty => _dirty ??= _constructDirty();
  GeneratedBoolColumn _constructDirty() {
    return GeneratedBoolColumn(
      'dirty',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, country, dirty];
  @override
  Addresss get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'addresss';
  @override
  final String actualTableName = 'addresss';
  @override
  VerificationContext validateIntegrity(AddresssCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.country.present) {
      context.handle(_countryMeta,
          country.isAcceptableValue(d.country.value, _countryMeta));
    } else if (country.isRequired && isInserting) {
      context.missing(_countryMeta);
    }
    if (d.dirty.present) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableValue(d.dirty.value, _dirtyMeta));
    } else if (dirty.isRequired && isInserting) {
      context.missing(_dirtyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Address map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return fromData(data, _db, prefix: effectivePrefix);
  }

  Address fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final joinInfo = buildJoinInfo();
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    Address model = Address();
    model.id = intType.mapFromDatabaseResponse(data['${effectivePrefix}id']);
    model.country =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']);
    model.dirty =
        boolType.mapFromDatabaseResponse(data['${effectivePrefix}dirty']);
    return model;
  }

  @override
  Map<GeneratedColumn, TableInfo> buildJoinInfo() {
    return {};
  }

  @override
  Map<String, Variable> entityToSql(AddresssCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.country.present) {
      map['country'] = Variable<String, StringType>(d.country.value);
    }
    if (d.dirty.present) {
      map['dirty'] = Variable<bool, BoolType>(d.dirty.value);
    }
    return map;
  }

  @override
  Addresss createAlias(String alias) {
    return Addresss(_db, alias);
  }

  @override
  final bool dontWriteConstraints = true;
}
