class Question{
  int? id;
  String? question;
  List<String>? choices;

  Question({required this.id,required this.question, required this.choices});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    for(int i = 0; i < json['choices'].length; i++){
      choices!.add(json['choices'][i]);
    }
    // choices = json['answers'].cast<String>();
  }
}