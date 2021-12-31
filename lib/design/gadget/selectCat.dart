import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/models/famille.dart';


class CategoriesDropDown extends StatefulWidget {
  List<Famille> categories;

  Function(Famille) callback;

  CategoriesDropDown(
      this.categories,
      this.callback, {
        Key key,
      }) : super(key: key);

  @override
  _CategoriesDropDownState createState() => _CategoriesDropDownState();
}

class _CategoriesDropDownState extends State<CategoriesDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Famille>(
      hint: Text('Select famille'),
      onChanged: (Famille value){
        setState(() {
          widget.callback(value);
        });
      },
      items: widget.categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category.name),
        );
      }).toList()
    );
  }
}
