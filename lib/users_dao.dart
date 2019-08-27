import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/dirty_column.dart';
import 'package:trial_moor/vd_database.dart';

//class User = DBUser with UserFunc;

part 'users_dao.g.dart';

class User extends DataClass with DirtyColumn implements Insertable<User> {
  @PrimaryKey()
  String id;

  @EntityColumn(isNullable: true)
  String name;

  User({@required this.id, @required this.name});

  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return User(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    ) as T;
  }

  User copyWith({String id, String name}) => User(
    id: id ?? this.id,
    name: name ?? this.name,
  );
  @override
  String toString() {
    return (StringBuffer('User(')
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
          (other is User && other.id == id && other.name == name);
}

//@UseDao(tables:[Users], entity: User)
@UseDao(entity: User)
class UsersDao extends DatabaseAccessor<VDDatabase> with _$UsersDaoMixin {
  UsersDao(VDDatabase db) : super(db);

  void foo() {}
}
