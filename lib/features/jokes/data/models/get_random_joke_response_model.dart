class GetRandomJokeResponseModel {
  GetRandomJokeResponseModel({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });
  late final List<dynamic> categories;
  late final String createdAt;
  late final String iconUrl;
  late final String id;
  late final String updatedAt;
  late final String url;
  late final String value;

  GetRandomJokeResponseModel.fromJson(Map<String, dynamic> json){
    categories = List.castFrom<dynamic, dynamic>(json['categories']);
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories;
    _data['created_at'] = createdAt;
    _data['icon_url'] = iconUrl;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['url'] = url;
    _data['value'] = value;
    return _data;
  }
}