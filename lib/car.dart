import 'package:moor_flutter/moor_flutter.dart';
import 'package:trial_moor/preference_converter.dart';

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 6, max: 32)();

//  TextColumn get preference => text().map(const PreferenceConverter()).nullable()();
}
