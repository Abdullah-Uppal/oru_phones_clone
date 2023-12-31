import 'package:dio/dio.dart';
import 'package:oru_phones/models/mobile/mobile.dart';
import 'package:oru_phones/models/search_model.dart';

class OruPhonesApi {
  Future<SearchModel> search(String query) async {
    var response = await Dio().post(
      "https://dev2be.oruphones.com/api/v1/global/assignment/searchModel",
      data: {
        "searchModel": query,
      },
    );
    return SearchModel.fromJson(response.data);
  }

  Future<List<Mobile>> getMobiles(int limit, int page) async {
    var response = await Dio().get(
        "https://dev2be.oruphones.com/api/v1/global/assignment/getListings",
        queryParameters: {
          "limit": limit,
          "page": page,
        });
    // 204 -> no content
    return response.statusCode == 204
        ? []
        : (response.data['listings'] as List)
            .map((e) => Mobile.fromMap(e))
            .toList();
  }
}
