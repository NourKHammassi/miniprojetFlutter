import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/composant_op.dart';
import 'package:miniprojet/design/gadget/listeComposant.dart';
import 'package:miniprojet/design/gadget/topButton.dart';


class CompPage extends StatefulWidget {
  CompPage({Key key})
      : super(
          key: key,
        );

  @override
  _CompPageState createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  ComposantsOp compOperations = ComposantsOp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('les composants disponibles'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonBarho(),
                FutureBuilder(
                  future: compOperations.getAll(),
                  builder: (context, snapshot){
                    if(snapshot.hasError) print('error');
                    var data = snapshot.data;
                    return snapshot.hasData ? ComposantList(data) : new Center(child: Text('pas de composnats à afficher'),);
                  },
                ),
              ],
            ),

        ),
      ),
    );
  }
}
