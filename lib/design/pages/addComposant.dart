import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/composant_op.dart';
import 'package:miniprojet/data/emplyee_op.dart';
import 'package:miniprojet/data/famille.dart';
import 'package:miniprojet/models/composant.dart';
import 'package:miniprojet/models/employee.dart';
import 'package:miniprojet/models/famille.dart';
import 'package:miniprojet/page/Accueil.dart';
import 'package:miniprojet/design/gadget/selectCat.dart';
import 'package:miniprojet/design/gadget/selectEmp.dart';


class AddComposantPage extends StatefulWidget {
  Composant composant;
  AddComposantPage({Key key}) : super(key: key);

  @override
  _AddComposantPagestate createState() => _AddComposantPagestate();
}

class _AddComposantPagestate extends State<AddComposantPage> {
  final _nameController = TextEditingController();
  final _qttController = TextEditingController();
  ComposantsOp composantsOperations = ComposantsOp();
  FamilleOp familleOperations = FamilleOp();
  EmployeOp employeOp = EmployeOp();

  Famille _selectedFamille;
  Employee _selectedEmployee;


  callback(selectedCategory){
    setState(() {
      _selectedFamille = selectedCategory;
      print(_selectedFamille.name);
    });
  }
  callback2(selectedEmployee){
    setState(() {
      _selectedEmployee = selectedEmployee;
      print(selectedEmployee.nom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un composant'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/Accueil');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _qttController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Quantité'),
              ),
            ),
            FutureBuilder<List<Famille>>(
              future: familleOperations.getAllfamilles(),
              builder: (context, snapshot) {
                return snapshot.hasData ? CategoriesDropDown(snapshot.data, callback) : Text('Pas encore de Composants');
              },
            ),
            /*FutureBuilder<List<Employee>>(
              future: employeOp.getAllEMP(),
              builder: (context, snapshot) {
                return snapshot.hasData ? EmployeesDropDown(snapshot.data, callback) : Text('No employees');
              },
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final composant = Composant(
              name: _nameController.text, qtt: _qttController.text, famille: _selectedFamille.id
            //  , employee:_selectedEmployee.id
          );
          composantsOperations.create(composant);
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
