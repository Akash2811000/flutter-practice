import 'dart:convert';

/// quote_id : 1
/// quote : "I am not in danger, Skyler. I am the danger!"
/// author : "Walter White"
/// series : "Breaking Bad"

QuoteModel quoteModelFromJson(String str) => QuoteModel.fromJson(json.decode(str));
String quoteModelToJson(QuoteModel data) => json.encode(data.toJson());
class QuoteModel {
  QuoteModel({
      this.quoteId, 
      this.quote, 
      this.author, 
      this.series,});

  QuoteModel.fromJson(dynamic json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }
  int? quoteId;
  String? quote;
  String? author;
  String? series;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quote_id'] = quoteId;
    map['quote'] = quote;
    map['author'] = author;
    map['series'] = series;
    return map;
  }

}