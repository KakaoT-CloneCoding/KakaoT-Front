class SearchModel {
  late String place_name;
  late String lat;
  late String lng;
  late String road_address_name;

  SearchModel({place_name, lat, lng, road_address_name});

  SearchModel.fromJson(Map<String, dynamic> json) {
    place_name = json["place_name"];
    lat = json["x"];
    lng = json["y"];
    road_address_name = json["road_address_name"];
  }
}
