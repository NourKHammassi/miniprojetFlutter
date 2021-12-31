import 'package:flutter/material.dart';

import "package:flutter/material.dart";
import 'package:miniprojet/design/pages/addComposant.dart';
import 'package:miniprojet/design/pages/addFamille.dart';
import 'package:miniprojet/design/pages/add_employee.dart';
import 'package:miniprojet/design/pages/composant_page.dart';
import 'package:miniprojet/design/pages/modifComposant.dart';

import 'page/Accueil.dart';
import 'page/Categorie.dart';
import 'page/Login_Screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/accueil': (context) => Accueil(),
          '/AddEMPLOYEE':(context) => AddEMPLOYEE(),
          '/compPage': (context) => CompPage(),
          '/addComp': (context) => AddComposantPage(),
          '/editcomp': (context) => EditComp(),
          '/addfammillePage': (context) => AddFamillePage(),


        },
        theme: ThemeData(primarySwatch: Colors.green),
        home: LoginPage());

  }

}
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => ContactsPage(),
        '/addContactPage': (context) => AddContactPage(),
        '/edit': (context) => EditContactPage(),
        '/searchPage': (context) => SearchPage(),
        '/addCategoryPage': (context) => AddCategoryPage(),
        '/searchContactsByCategory': (context) =>SearchContactsByCategory()
      },
      home: ContactsPage(),
    );
  }
}
*/