import 'dart:convert';

class Image {
  String? fullImage;

  Image({this.fullImage});

  @override
  String toString() => 'Image(fullImage: $fullImage)';

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        fullImage: data['fullImage'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'fullImage': fullImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());
}
