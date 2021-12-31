import 'package:flutter/material.dart';
import 'package:miniprojet/page/Login_Screen.dart';
import 'package:miniprojet/design/pages/addFamille.dart';
import 'package:miniprojet/design/pages/composant_page.dart';


class Accueil extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}
class _HomePageState extends State<Accueil> {
  int selectedPage = 0;

  final _pageOptions = [
    CompPage(),
    AddFamillePage(),
    LoginPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), title: Text('Home')
            ,backgroundColor: Colors.white54,),
            BottomNavigationBarItem(icon: Icon(Icons.add_chart, size: 30), title: Text('Add famille')
            ,backgroundColor: Colors.limeAccent,),
            /*BottomNavigationBarItem(icon: Icon(Icons.wallet_travel, size: 30), title: Text('Account'),
                backgroundColor: Colors.deepOrangeAccent),*/
            BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), title: Text('logOut'),
                backgroundColor: Colors.purple),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )
    );
  }
}
/*
class Accueil extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Accueil> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> elementen = <Widget>[
    Column(
      children: <Widget>[
        Text(
          "manage your material with ease!", style:TextStyle(
  fontSize: 20,),
        ),
  Image(image: AssetImage('assets/img.png'),
    height: 500,
    width: 500,),

      ],
    ),
    Column(
      children: <Widget>[
        Text("Index 1: History"),
        FlutterLogo(),
      ],
    ),
    Column(
      children: <Widget>[
        Text(
          "Index 2: Challenges",
        ),
        FlutterLogo(),
      ],
    ),
    Column(
      children: <Widget>[
        Text("Index 3: Settings"),
        FlutterLogo(),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GESTION'),
        ),
      body: Center(
        child: elementen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.business),
            label: 'Categorie',
            backgroundColor: Colors.blueAccent,
    ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
*/