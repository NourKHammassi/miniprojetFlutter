class Famille {
  int id;
  String name;

  Famille({
    this.id,
    this.name,
  });

  Famille.fromMap(dynamic obj) {
    this.id = obj['familleId'];
    this.name = obj['familleName'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'familleName': name,
    };

    return map;
  }
}
