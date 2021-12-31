import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
      DatabaseRepository.privateConstructor();

  final _databaseName = 'projetv1';
  final _databaseVersion = 1;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
    }
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: await onCreate);
  }


  Future onCreate(Database db, int version) async {

    await db.execute('''
          CREATE TABLE composant (
            composanttId INTEGER PRIMARY KEY AUTOINCREMENT,
            composantName STRING ,
            composantQtt STRING NOT NULL,
            FK_composant_famille INT NOT NULL,
      
            FOREIGN KEY (FK_composant_famille) REFERENCES famille (familleId)
          
    
            
          )
          ''');
    //FK_composant_employee INT ,
     //   FOREIGN KEY (FK_composant_famille) REFERENCES famille (familleId),
   // FOREIGN KEY (FK_composant_employee) REFERENCES employee (employeeId)
    await db.execute('''
          CREATE TABLE famille (
            familleId INTEGER PRIMARY KEY AUTOINCREMENT,
            familleName STRING NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE employee (
            employeeId INTEGER PRIMARY KEY AUTOINCREMENT,
            employeeNom STRING NOT NULL,
            employeePrenom STRING NOT NULL,
            employeenumtelf STRING NOT NULL
            
            
          )
          ''');
  }
}
