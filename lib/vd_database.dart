import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/car.dart';
import 'package:trial_moor/users_dao.dart';

part 'vd_database.g.dart';

@UseMoor(tables: [Cars], daos: [UsersDao])
class VDDatabase extends _$VDDatabase {
  VDDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

}
