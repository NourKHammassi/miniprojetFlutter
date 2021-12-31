import 'package:flutter/material.dart';

import 'Accueil.dart';


class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  final myEmailController = TextEditingController();
  final myPwdController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myEmailController.dispose();
    myPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login '),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Connecter vous',
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: myEmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: myPwdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                        onPressed: () {
                          //retireve login input
                          if (myEmailController.text == "ne@gmail.com" && myPwdController.text == "123"){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => Accueil()));}
                        },

                    )),


          ],
            )));
  }


}