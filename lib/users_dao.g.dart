// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dao.dart';

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
        : Preference.fromJson(json['preference'] as Map<String, dynamic>);
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
  return val;
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UsersDaoMixin on DatabaseAccessor<VDDatabase> {
  Users _users;
  Users get users => _users ??= Users(db);
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
    dirty: instance.dirty == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.dirty),
  );
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> name;
  final Value<Preference> preference;
  final Value<bool> dirty;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.preference = const Value.absent(),
    this.dirty = const Value.absent(),
  });
  UsersCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<Preference> preference,
      Value<bool> dirty}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      preference: preference ?? this.preference,
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
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
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
  List<GeneratedColumn> get $columns => [id, name, preference, dirty];
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
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    User model = User();
    model.id = stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']);
    model.name =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']);
    model.preference = Users.$converter0.mapToDart(stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}preference']));
    model.dirty =
        boolType.mapFromDatabaseResponse(data['${effectivePrefix}dirty']);
    return model;
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
}
