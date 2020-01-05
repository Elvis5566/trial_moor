import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/db_save.dart';
import 'package:trial_moor/dirty_column.dart';
import 'package:trial_moor/vd_database.dart';

part 'address.g.dart';

@JsonSerializable(includeIfNull: false)
class Address extends DataClass with DirtyColumn, DBSave implements Insertable<Address> {
  Address();

  @EntityPrimaryKey()
  int id;

  @EntityColumn(isNullable: true)
  String country;

  static Address fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  UpdateCompanion<Address> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  String toString() => toJsonString();

  @override
  dynamic get dao => VDDatabase.sharedInstance.addresssDao;

}

@UseDao(entity: Address)
class AddresssDao extends DatabaseAccessor<VDDatabase> with _$AddresssDaoMixin {
  AddresssDao(VDDatabase db) : super(db);

}
