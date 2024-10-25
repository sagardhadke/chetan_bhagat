class TextQuotes {
  String? id;
  String? textQuote;

  TextQuotes({this.id, this.textQuote});

  TextQuotes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    textQuote = json["text_quote"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["text_quote"] = textQuote;
    return _data;
  }

  static List<TextQuotes>? ofTextQuotes(List ofData) {
    return ofData.map((e) => TextQuotes.fromJson(e)).toList();
  }
}
