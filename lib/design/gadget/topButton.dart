import 'package:flutter/material.dart';

class ButtonBarho extends StatelessWidget {
  ButtonBarho({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton.icon(
            label: Text('Add composant'),
            icon: Icon(Icons.web),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/addComp');
            },
            //child: Icon(Icons.person_add),Text('Woolha.com'),


          ),
          /*FloatingActionButton(
            heroTag: 'contacts',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/addContactPage');
            },
            child: Icon(Icons.person_add),
          ),*/
          /*FloatingActionButton(
            heroTag: 'search',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/searchPage');
            },
            child: Icon(Icons.search),
          ),*/
          TextButton.icon(
            label: Text('Add employee'),
            icon: Icon(Icons.person_add),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/AddEMPLOYEE');
            },
            //child: Icon(Icons.person_add),Text('Woolha.com'),


          ),
          /*FloatingActionButton(
            heroTag: 'search contact by category',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/searchContactsByCategory');
            },
            child: Icon(Icons.list),
          ),*/

        ],
      ),
    );
  }
}
