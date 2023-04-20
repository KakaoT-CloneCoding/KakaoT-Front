class SearchModel {
  late String place_name;
  late String lat;
  late String lng;
  late String address_name;

  SearchModel({place_name, lat, lng, address_name});

  SearchModel.fromJson(Map<String, dynamic> json) {
    place_name = json["place_name"];
    lat = json["x"];
    lng = json["y"];
    address_name = json["address_name"];
  }
}
