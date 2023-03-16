import 'dart:convert';

List<BookModel> bookModelFromJson(String str) =>
    List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

String bookModelToJson(List<BookModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModel {
  String title = '';
  String subtitle = '';
  String isbn13 = '';
  String price = '';
  String image = '';
  String url = '';

  BookModel({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      title: json["title"],
      subtitle: json["subtitle"],
      isbn13: json["isbn13"],
      price: json["price"],
      image: json["image"],
      url: json["url"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
