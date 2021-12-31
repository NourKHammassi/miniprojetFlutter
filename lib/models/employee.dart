class Employee {
  int id;
  String nom;
  String prenom ;
  String tlf ;

  Employee({
    this.id,
    this.nom,
    this.prenom,
    this.tlf,
  });

  Employee.fromMap(dynamic obj) {
    this.id = obj['employeeId'];
    this.nom = obj['employeeNom'];
    this.prenom = obj['employeePrenom'];
    this.tlf = obj['employeenumtelf'];
  }


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'employeeNom': nom,
    };


    return map;
  }
}
