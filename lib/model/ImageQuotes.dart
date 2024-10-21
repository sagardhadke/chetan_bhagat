class ImageQuotes {
  String? id;
  String? image;
  String? thumbImage;

  ImageQuotes({this.id, this.image, this.thumbImage});

  ImageQuotes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["thumb_image"] = thumbImage;
    return _data;
  }

  static List<ImageQuotes>? ofimgQuotes(List ofData) {
    return ofData.map((e) => ImageQuotes.fromJson(e)).toList();
  }
}
