import 'dart:convert';

import 'package:collection/collection.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Image) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => fullImage.hashCode;
}
