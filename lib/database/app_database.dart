import 'package:mydespesas/database/dao/cartao_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database?> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'myDespesas.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CartaoDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
