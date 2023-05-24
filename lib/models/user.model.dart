class User {
  String? firstname;
  int? id;
  String? idno;
  String? lastname;
  String? score;

  User({this.firstname, this.id, this.idno, this.lastname, this.score});

  User.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    id = json['id'];
    idno = json['idno'];
    lastname = json['lastname'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['id'] = this.id;
    data['idno'] = this.idno;
    data['lastname'] = this.lastname;
    data['score'] = this.score;
    return data;
  }
}