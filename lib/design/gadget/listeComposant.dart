import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/composant_op.dart';
import 'package:miniprojet/models/composant.dart';
import 'package:miniprojet/design/pages/modifComposant.dart';


class ComposantList extends StatelessWidget {
  List<Composant> comp;
  ComposantsOp comOperations = ComposantsOp();

  ComposantList(List<Composant> this.comp, {
    Key key
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: comp.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${comp[index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),



                  ),

                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ' ${comp[index].id} ',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${comp[index].name}  ${comp[index].qtt}',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditComp(
                                        composant: comp[index],
                                      )));
                            },
                            color: Colors.yellowAccent,
                            child: Icon(Icons.align_vertical_bottom_sharp, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            onDismissed: (direction) {
              comOperations.delete(comp[index]);
            },
          );
        },
      ),
    );

  }
}
