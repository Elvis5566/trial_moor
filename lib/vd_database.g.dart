// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vd_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Car extends DataClass implements Insertable<Car> {
  final int id;
  final String name;
  Car({@required this.id, @required this.name});
  factory Car.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Car(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory Car.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Car(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Car>>(bool nullToAbsent) {
    return CarsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    ) as T;
  }

  Car copyWith({int id, String name}) => Car(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Car(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Car && other.id == id && other.name == name);
}

class CarsCompanion extends UpdateCompanion<Car> {
  final Value<int> id;
  final Value<String> name;
  const CarsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CarsCompanion copyWith({Value<int> id, Value<String> name}) {
    return CarsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class $CarsTable extends Cars with TableInfo<$CarsTable, Car> {
  final GeneratedDatabase _db;
  final String _alias;
  $CarsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $CarsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cars';
  @override
  final String actualTableName = 'cars';
  @override
  VerificationContext validateIntegrity(CarsCompanion d,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Car map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Car.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CarsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    return map;
  }

  @override
  $CarsTable createAlias(String alias) {
    return $CarsTable(_db, alias);
  }
}

abstract class _$VDDatabase extends GeneratedDatabase {
  _$VDDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $CarsTable _cars;
  $CarsTable get cars => _cars ??= $CarsTable(this);
  UsersDao _usersDao;
  UsersDao get usersDao => _usersDao ??= UsersDao(this as VDDatabase);
  @override
  List<TableInfo> get allTables => [cars, ...usersDao.tables];
}
