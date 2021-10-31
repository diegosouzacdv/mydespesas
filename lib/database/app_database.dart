import 'package:myexpenses/database/dao/card_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database?> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'myDespesas.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CardDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
