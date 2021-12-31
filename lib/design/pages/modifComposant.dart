import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/composant_op.dart';
import 'package:miniprojet/models/composant.dart';


class EditComp extends StatefulWidget {
  Composant composant;

  EditComp({Key key, this.composant})
      : super(
          key: key,
        );

  @override
  _EditCompState createState() => _EditCompState();
}

class _EditCompState extends State<EditComp> {
  ComposantsOp compOperations = ComposantsOp();

  var _nameController = TextEditingController();
  var _qttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.composant.name;
    _qttController.text = widget.composant.qtt;
    return Scaffold(
      appBar: AppBar(
        title: Text('modifier'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/Accueil');
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          widget.composant.name= _nameController.text;
          widget.composant.qtt= _qttController.text;

          compOperations.update(widget.composant);
        },
      ),
    );
  }
}
