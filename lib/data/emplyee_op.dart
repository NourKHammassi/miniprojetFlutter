

import 'package:miniprojet/data/database.dart';
import 'package:miniprojet/models/employee.dart';

class EmployeOp {
  EmployeOp employeOp;

  final dbProvider = DatabaseRepository.instance;

  insert(Employee employee) async {
    final db = await dbProvider.database;
    db.insert('employee', employee.toMap());
    print('employee inserted');
  }

  Future<List<Employee>> getAllEMP() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('employee');
    List<Employee> employees =
    allRows.map((employee) => Employee.fromMap(employee)).toList();
    return employees;
  }
}