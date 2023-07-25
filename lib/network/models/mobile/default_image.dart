import 'dart:convert';


class DefaultImage {
  String? fullImage;

  DefaultImage({this.fullImage});

  @override
  String toString() => 'DefaultImage(fullImage: $fullImage)';

  factory DefaultImage.fromMap(Map<String, dynamic> data) => DefaultImage(
        fullImage: data['fullImage'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'fullImage': fullImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DefaultImage].
  factory DefaultImage.fromJson(String data) {
    return DefaultImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DefaultImage] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  int get hashCode => fullImage.hashCode;
}
