import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/models/employee.dart';


class EmployeesDropDown extends StatefulWidget {
  List<Employee> emp;

  Function(Employee) callback;

  EmployeesDropDown(
      this.emp,
      this.callback, {
        Key key,
      }) : super(key: key);

  @override
  _empDropDownState createState() => _empDropDownState();
}

class _empDropDownState extends State<EmployeesDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Employee>(
        hint: Text('Select employee'),
        onChanged: (Employee value){
          setState(() {
            widget.callback(value);
          });
        },
        items: widget.emp.map((employee) {
          return DropdownMenuItem(
            value: employee,
            child: Text(employee.nom),
          );
        }).toList()
    );
  }
}
