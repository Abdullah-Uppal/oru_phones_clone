import 'package:dio/dio.dart';
import 'package:oru_phones/network/models/search_model.dart';

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
}
