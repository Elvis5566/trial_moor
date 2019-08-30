//import 'package:moor/moor.dart';

import 'package:moor_flutter/moor_flutter.dart';

mixin DBSave {
  dynamic get dao;

  Future<void> save({bool fireEvent = false}) async {
    await dao.upsert(this);
//    if (fireEvent) injectorAll.eventBus.fire(updateEvent);
  }
}