class SearchModel {
  late final List<dynamic> makes;
  late final List<dynamic> models;
  SearchModel({
    required this.makes,
    required this.models,
  });
  factory SearchModel.fromJson(Map<String, dynamic> data) {
    return SearchModel(
      makes: data['makes'],
      models: data['models'],
    );
  }
}
