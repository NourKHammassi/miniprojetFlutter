import 'package:miniprojet/data/database.dart';
import 'package:miniprojet/models/famille.dart';



class FamilleOp {
  FamilleOp familleOperations;

  final dbProvider = DatabaseRepository.instance;

  create(Famille famille) async {
    final db = await dbProvider.database;
    db.insert('famille', famille.toMap());
  }
  

  Future<List<Famille>> getAllfamilles() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('famille');
    List<Famille> familles =
    allRows.map((famille) => Famille.fromMap(famille)).toList();
    return familles;
  }
  deleteContact(Famille famille) async {
    final db = await dbProvider.database;
    await db.delete('famille', where: 'familleId=?', whereArgs: [famille.id]);
  }
  
}


