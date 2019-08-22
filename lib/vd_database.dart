import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/car.dart';
import 'package:trial_moor/user.dart';

part 'vd_database.g.dart';

@UseMoor(tables: [Users, Cars])
class VDDatabase extends _$VDDatabase {
  VDDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

  Future<List<User>> get allTodoEntries => select(users).get();
}
