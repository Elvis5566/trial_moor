// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vd_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
abstract class _$VDDatabase extends GeneratedDatabase {
  _$VDDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  UsersDao _usersDao;
  UsersDao get usersDao => _usersDao ??= UsersDao(this as VDDatabase);
  AddresssDao _addresssDao;
  AddresssDao get addresssDao =>
      _addresssDao ??= AddresssDao(this as VDDatabase);
  @override
  List<TableInfo> get allTables => [...usersDao.tables, ...addresssDao.tables];
}
