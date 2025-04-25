import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'data.g.dart';

class User extends Table{
  @override
  String get tableName => 'users';

  late final firstName = text()();
  late final lastName = text().nullable()();
  late final email = text().withLength(max:63)();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final passKey = text()();
  //primary key
  @override
  Set<Column<Object>> get primaryKey => {email};
}

@DriftDatabase(tables: [User])
class OrderManagementDatabase extends _$OrderManagementDatabase{
  OrderManagementDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(){
    return driftDatabase(
      name: 'order_management_database',
      //database location 
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory, 
      ),
    );
  }
}

final appData = OrderManagementDatabase();




