import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/address.dart';
import 'package:trial_moor/db_save.dart';
import 'package:trial_moor/dirty_column.dart';
import 'package:trial_moor/preference.dart';
import 'package:trial_moor/preference_converter.dart';
import 'package:trial_moor/vd_database.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User extends DataClass with DirtyColumn, DBSave implements Insertable<User> {
  User();

  @EntityPrimaryKey()
  String id;

  @EntityColumn(isNullable: true)
  String name;

  @EntityColumn(isNullable: true, converter: PreferenceConverter)
  Preference preference;

  @EntityToOne(AddresssDao, isNullable: true)
  Address address;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) => _$createCompanion(this, nullToAbsent) as T;

  @override
  String toString() => toJsonString();

  @override
  dynamic get dao => VDDatabase.sharedInstance.usersDao;


//  User copyWith({String id, String name}) => User(
//    id: id ?? this.id,
//    name: name ?? this.name,
//  );

}

//typedef Expression<bool, BoolType> WhereFilter(Users tbl);

//@UseDao(tables:[Users], entity: User)
@UseDao(entity: User)
class UsersDao extends DatabaseAccessor<VDDatabase> with _$UsersDaoMixin {
  UsersDao(VDDatabase db) : super(db);

  Future<int> foo(UsersCompanion compainon) {
    return update(users).write(compainon);
  }
}
