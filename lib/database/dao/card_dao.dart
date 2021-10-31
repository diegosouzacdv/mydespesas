import 'package:myexpenses/database/app_database.dart';
import 'package:myexpenses/models/card.dart';
import 'package:sqflite/sqflite.dart';

class CardDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
      '$_name TEXT NOT NULL, '
      '$_active INTEGER NOT NULL, '
      '$_cardNumber INTEGER NOT NULL, '
      '$_cardFlag TEXT NOT NULL, '
      '$_securityNumber INTEGER NOT NULL, '
      '$dateCardExpiration TEXT NOT NULL)';

  static const String _tableName = 'card';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _active = 'active';
  static const String _cardNumber = 'cardNumber';
  static const String _cardFlag = 'cardFlag';
  static const String _securityNumber = 'securityNumber';
  static const String dateCardExpiration = 'dateCardExpiration';

  Future<int?> save(Card card) async {
    final Database? db = await getDatabase();
    //db?.rawInsert("DROP TABLE card;");
    return db?.insert(_tableName, card.toSqlite());
  }

  Future<List<Card>?> findAll() async {
    final Database? db = await getDatabase();
    var query = await db?.query(_tableName);
    final List<Card> listCards = [];
    if (query != null) {
      for (Map<String, dynamic> map in query) {
        final Card card = Card.fromJson(map);
        listCards.add(card);
      }
    }
    return listCards;
  }

  Future<List<Card>?> getId(int id) async {
    final Database? db = await getDatabase();
    var query = await db?.query(_tableName, where: '$_id == id');
    final List<Card> listCards = [];
    if (query != null) {
      for (Map<String, dynamic> map in query) {
        final Card card = Card.fromJson(map);
        listCards.add(card);
      }
    }
    return listCards;
  }

  Future<int> update(Card card) async {
    final Database? db = await getDatabase();
    final Map<String, dynamic> contactMap = card.toJson();
    return db!.update(
        _tableName,
        contactMap,
        where: 'id = ?',
      whereArgs: [card.id],
    );
  }

  Future<int> delete(int id) async {
    final Database? db = await getDatabase();
    return db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}