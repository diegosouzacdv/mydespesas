import 'package:mydespesas/database/app_database.dart';
import 'package:mydespesas/models/cartao.dart';
import 'package:sqflite/sqflite.dart';

class CartaoDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_codigo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
      '$_nome TEXT NOT NULL, '
      '$_ativo INTEGER NOT NULL, '
      '$_numero INTEGER NOT NULL, '
      '$_bandeira TEXT NOT NULL, '
      '$_codigoSeguranca INTEGER NOT NULL, '
      '$_dataVencimento TEXT NOT NULL)';

  static const String _tableName = 'cartao';
  static const String _codigo = 'codigo';
  static const String _nome = 'nome';
  static const String _ativo = 'ativo';
  static const String _numero = 'numero';
  static const String _bandeira = 'bandeira';
  static const String _codigoSeguranca = 'codigoSeguranca';
  static const String _dataVencimento = 'dataVencimento';

  Future<int?> save(Cartao cartao) async {
    final Database? db = await getDatabase();
    //db?.rawInsert("DROP TABLE cartao;");
    return db?.insert(_tableName, cartao.toSqlite());
  }

  Future<List<Cartao>?> findAll() async {
    final Database? db = await getDatabase();
    var query = await db?.query(_tableName);
    final List<Cartao> listCartoes = [];
    if (query != null) {
      for (Map<String, dynamic> map in query) {
        final Cartao cartao = Cartao.fromJson(map);
        listCartoes.add(cartao);
      }
    }
    return listCartoes;
  }

  Future<List<Cartao>?> getId(int id) async {
    final Database? db = await getDatabase();
    var query = await db?.query(_tableName, where: '$_codigo == id');
    final List<Cartao> listCartoes = [];
    if (query != null) {
      for (Map<String, dynamic> map in query) {
        final Cartao cartao = Cartao.fromJson(map);
        listCartoes.add(cartao);
      }
    }
    return listCartoes;
  }

  Future<int> update(Cartao cartao) async {
    final Database? db = await getDatabase();
    final Map<String, dynamic> contactMap = cartao.toJson();
    return db!.update(
        _tableName,
        contactMap,
        where: 'id = ?',
      whereArgs: [cartao.codigo],
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