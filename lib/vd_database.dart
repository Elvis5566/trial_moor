import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/address.dart';
import 'package:trial_moor/user.dart';

part 'vd_database.g.dart';

@UseMoor(daos: [UsersDao, AddresssDao])
class VDDatabase extends _$VDDatabase {
  VDDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  static VDDatabase sharedInstance = VDDatabase();

  @override
  int get schemaVersion => 1;

}
