class Question {
  int? iD;
  String? oPTION;
  int? qID;
  String? qUESTION;
  List<String> choices = [];

  Question({this.iD, this.oPTION, this.qID, this.qUESTION});

  Question fromJson(Map<String, dynamic> json) {
    Question q = Question();
    q.iD = json['ID'];
    q.oPTION = json['OPTION'];
    q.qID = json['QUESTIONID'];
    q.qUESTION = json['QUESTION'];
    List<String>? temp = q.oPTION!.split("\r\n");
    for(int i = 0; i < temp.length; i++){
      q.choices.add(temp[i]);
    }
    return q;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['OPTION'] = this.oPTION;
    data['QUESTIONID'] = this.qID;
    data['QUESTION'] = this.qUESTION;
    return data;
  }
}