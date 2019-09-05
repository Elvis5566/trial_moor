// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..dirty = json['dirty'] as bool
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..preference = json['preference'] == null
        ? null
        : Preference.fromJson(json['preference'] as Map<String, dynamic>)
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dirty', instance.dirty);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('preference', instance.preference);
  writeNotNull('address', instance.address);
  return val;
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UsersDaoMixin on DatabaseAccessor<VDDatabase> {
  Users _users;
  Users get users => _users ??= Users(db);
  Future upsert(User instance) {
    return transaction((_) async {
      await instance.address?.save();
      await into(users).insert(instance, orReplace: true);
    });
  }

  Future<List<User>> loadAll(
      {Expression<bool, BoolType> where(Users table),
      int limit,
      int offset,
      List<OrderClauseGenerator<Users>> orderBy}) {
    final statement = select(users);
    if (where != null) {
      statement.where(where);
    }
    if (limit != null) {
      statement.limit(limit, offset: offset);
    }
    if (orderBy != null) {
      statement.orderBy(orderBy);
    }
    final joins = users.getJoins();
    return joins.length == 0
        ? statement.get()
        : statement.join(joins).get().then((rows) {
            return rows.map((row) => row.readTable(users)).toList();
          });
  }

  Future<User> load(key) async {
    final list = await (select(users)
          ..where((table) => table.primaryKey.first.equals(key)))
        .get();
    return list.length > 0 ? list.first : null;
  }

  List<TableInfo> get tables => [users];
}
UsersCompanion _$createCompanion(User instance, bool nullToAbsent) {
  return UsersCompanion(
    id: instance.id == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.id),
    name: instance.name == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.name),
    preference: instance.preference == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.preference),
    addressId: instance.address == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.address.id),
    dirty: instance.dirty == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.dirty),
  );
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> name;
  final Value<Preference> preference;
  final Value<int> addressId;
  final Value<bool> dirty;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.preference = const Value.absent(),
    this.addressId = const Value.absent(),
    this.dirty = const Value.absent(),
  });
  UsersCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<Preference> preference,
      Value<int> addressId,
      Value<bool> dirty}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      preference: preference ?? this.preference,
      addressId: addressId ?? this.addressId,
      dirty: dirty ?? this.dirty,
    );
  }
}

class Users extends Table with TableInfo<Users, User> {
  final GeneratedDatabase _db;
  final String _alias;
  Users(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _preferenceMeta = const VerificationMeta('preference');
  GeneratedTextColumn _preference;
  GeneratedTextColumn get preference => _preference ??= _constructPreference();
  GeneratedTextColumn _constructPreference() {
    return GeneratedTextColumn(
      'preference',
      $tableName,
      true,
    );
  }

  final VerificationMeta _addressIdMeta = const VerificationMeta('addressId');
  GeneratedIntColumn _addressId;
  GeneratedIntColumn get addressId => _addressId ??= _constructAddressId();
  GeneratedIntColumn _constructAddressId() {
    return GeneratedIntColumn(
      'addressId',
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
  List<GeneratedColumn> get $columns =>
      [id, name, preference, addressId, dirty];
  @override
  Users get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_preferenceMeta, const VerificationResult.success());
    if (d.addressId.present) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableValue(d.addressId.value, _addressIdMeta));
    } else if (addressId.isRequired && isInserting) {
      context.missing(_addressIdMeta);
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
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return fromData(data, _db, prefix: effectivePrefix);
  }

  User fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final joinInfo = buildJoinInfo();
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    User model = User();
    model.id = stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']);
    model.name =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']);
    model.preference = Users.$converter0.mapToDart(stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}preference']));
    model.address = joinInfo[addressId]
        .map(data, tablePrefix: joinInfo[addressId].$tableName);
    model.dirty =
        boolType.mapFromDatabaseResponse(data['${effectivePrefix}dirty']);
    return model;
  }

  @override
  Map<GeneratedColumn, TableInfo> buildJoinInfo() {
    return {
      addressId: Addresss(_db, '${$tableName}_address'),
    };
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.preference.present) {
      final converter = Users.$converter0;
      map['preference'] =
          Variable<String, StringType>(converter.mapToSql(d.preference.value));
    }
    if (d.addressId.present) {
      map['addressId'] = Variable<int, IntType>(d.addressId.value);
    }
    if (d.dirty.present) {
      map['dirty'] = Variable<bool, BoolType>(d.dirty.value);
    }
    return map;
  }

  @override
  Users createAlias(String alias) {
    return Users(_db, alias);
  }

  static PreferenceConverter $converter0 = const PreferenceConverter();
  @override
  final bool dontWriteConstraints = true;
}
