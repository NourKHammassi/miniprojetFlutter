class Composant {
  int id;
  String name;
  String qtt;
  int famille;
 // int employee;

  Composant({this.id, this.name, this.qtt, this.famille
    //, this.employee
  });

  Composant.fromMap(dynamic obj) {
    this.id = obj['composanttId'];
    this.name = obj['composantName'];
    this.qtt = obj['composantQtt'];
    this.famille = obj['FK_composant_famille'];
   // this.employee =obj['FK_composant_employee'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'composantName': name,
      'composantQtt': qtt,
      'FK_composant_famille':famille,
    //  'FK_composant_employee':employee
    };

    return map;
  }
}
