import 'package:moor_flutter/moor_flutter.dart';

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 6, max: 32)();
}