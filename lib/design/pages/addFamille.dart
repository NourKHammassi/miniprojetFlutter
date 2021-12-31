import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/data/famille.dart';
import 'package:miniprojet/models/famille.dart';
import 'package:miniprojet/page/Accueil.dart';


/*
  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.red,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("O"),
              ),
              title: Text(
                this.products[position].name,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black),
              ),
              subtitle: Text(
                this.products[position].description,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Colors.black),
              ),
              onTap: () {
                goToDetail(this.products[position]);
              },
            ),
          );
        });
  }

  void goToProductAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd()));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        this.products = data;
        productCount = data.length;
      });
    });
  }

  void goToDetail(product) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ComposantList()));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }
}
*/

class AddFamillePage extends StatefulWidget {
  AddFamillePage({Key key}) : super(key: key);

  @override
  _AddFamillePageState createState() => _AddFamillePageState();
}

class _AddFamillePageState extends State<AddFamillePage> {
  final _familleController = TextEditingController();

  FamilleOp familleOperations = FamilleOp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter famille'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
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
                controller: _familleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'nom du famille'),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final famille = Famille(
              name: _familleController.text);
          familleOperations.create(famille);
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


