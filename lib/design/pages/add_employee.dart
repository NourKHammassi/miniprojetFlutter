import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/emplyee_op.dart';
import 'package:miniprojet/models/employee.dart';
import 'package:miniprojet/page/Accueil.dart';


class AddEMPLOYEE extends StatefulWidget {
  AddEMPLOYEE({Key key}) : super(key: key);


  @override
  _AddempPageState createState() => _AddempPageState();
}

class _AddempPageState extends State<AddEMPLOYEE> {
  final _employeeControllernom = TextEditingController();
  final _employeeControllerprenom = TextEditingController();
  final _employeeControllertelephone = TextEditingController();

  EmployeOp empOperations = EmployeOp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter employee'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'add employee',
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _employeeControllernom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'nom',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: _employeeControllerprenom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'prenom',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: _employeeControllertelephone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'num telephone',
                    ),
                  ),
                )

               ,


              ],
            ),),
/*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _employeeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'nom du famille'),
              ),

            ),

          ],
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final emp = Employee(
              nom: _employeeControllernom.text,
             prenom: _employeeControllerprenom.text,
             tlf: _employeeControllertelephone.text);
          empOperations.insert(emp);
          _navigateToNextScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Accueil()));
  }

}


