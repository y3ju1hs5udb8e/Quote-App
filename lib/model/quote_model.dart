class QuoteModel {
  String id;
  String content;
  String author;
  List tags;

  QuoteModel({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: json['tags'],
    );
  }
}
