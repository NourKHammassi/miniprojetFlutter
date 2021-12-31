
import 'package:miniprojet/data/database.dart';
import 'package:miniprojet/models/composant.dart';

class ComposantsOp {
  ComposantsOp composantsOp;

  final dbProvider = DatabaseRepository.instance;

  create(Composant Composant) async {
    final db = await dbProvider.database;
    db.insert('composant', Composant.toMap());
    print('Composant inserted');
  }

  update(Composant Composant) async {
    final db = await dbProvider.database;
    db.update('composant', Composant.toMap(),
        where: "composantId=?", whereArgs: [Composant.id]);
  }

  delete(Composant Composant) async {
    final db = await dbProvider.database;
    await db.delete('composant', where: 'composantId=?', whereArgs: [Composant.id]);
  }

  Future<List<Composant>> getAll() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('composant');
    List<Composant> composants =
    allRows.map((composant) => Composant.fromMap(composant)).toList();
    return composants;
  }

  Future<List<Composant>> getAllbyfamille(Composant composant) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.rawQuery('''
    SELECT * FROM composant 
    WHERE composant.FK_composant_famille = ${composant.id} 
    
    ''');
    List<Composant> contacts =
    allRows.map((composant) => Composant.fromMap(composant)).toList();
    return contacts;
  }

}

