import 'dart:convert';
import 'default_image.dart';

class Mobile {
  String deviceCondition;
  String listedBy;
  String deviceStorage;
  // List<Image>? images;
  DefaultImage defaultImage;
  String listingLocation;
  String make;
  String marketingName;
  String model;
  bool verified;
  String status;
  String listingDate;
  String deviceRam;
  String createdAt;
  int listingNumPrice;

  Mobile({
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.defaultImage,
    required this.listingLocation,
    required this.make,
    required this.marketingName,
    required this.model,
    required this.verified,
    required this.status,
    required this.listingDate,
    required this.deviceRam,
    required this.createdAt,
    required this.listingNumPrice,
  });

  @override
  String toString() {
    return 'Mobile(deviceCondition: $deviceCondition, listedBy: $listedBy, deviceStorage: $deviceStorage, defaultImage: $defaultImage, listingLocation: $listingLocation, make: $make, marketingName: $marketingName, model: $model, verified: $verified, status: $status, listingDate: $listingDate, deviceRam: $deviceRam, createdAt: $createdAt, listingNumPrice: $listingNumPrice)';
  }

  factory Mobile.fromMap(Map<String, dynamic> data) => Mobile(
        deviceCondition: data['deviceCondition'] as String,
        listedBy: data['listedBy'] as String,
        deviceStorage: data['deviceStorage'] as String,
        defaultImage:
            DefaultImage.fromMap(data['defaultImage'] as Map<String, dynamic>),
        listingLocation: data['listingLocation'] as String,
        make: data['make'] as String,
        marketingName: data['marketingName'] as String,
        model: data['model'] as String,
        verified: data['verified'] as bool,
        status: data['status'] as String,
        listingDate: data['listingDate'] as String,
        deviceRam: data['deviceRam'] as String,
        createdAt: data['createdAt'] as String,
        listingNumPrice: data['listingNumPrice'] as int,
      );

  Map<String, dynamic> toMap() => {
        'deviceCondition': deviceCondition,
        'listedBy': listedBy,
        'deviceStorage': deviceStorage,
        'defaultImage': defaultImage.toMap(),
        'listingLocation': listingLocation,
        'make': make,
        'marketingName': marketingName,
        'model': model,
        'verified': verified,
        'status': status,
        'listingDate': listingDate,
        'deviceRam': deviceRam,
        'createdAt': createdAt,
        'listingNumPrice': listingNumPrice,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mobile].
  factory Mobile.fromJson(String data) {
    return Mobile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Mobile] to a JSON string.
  String toJson() => json.encode(toMap());
}
