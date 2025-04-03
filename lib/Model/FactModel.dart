class FactModel {
  final String id;
  final String text;


  FactModel({
    required this.id,
    required this.text,

  });

  factory FactModel.fromJson(Map<String, dynamic> json) {
    return FactModel(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}
