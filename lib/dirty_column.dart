import 'package:moor_flutter/moor_flutter.dart';

mixin DirtyColumn {
  @EntityColumn(isNullable: true)
  String dirty;
}