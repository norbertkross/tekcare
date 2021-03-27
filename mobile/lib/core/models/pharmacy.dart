import 'dart:ffi';

/// A class representing the pharmacy model
/// and how it is represented in the database
/// It has methods that data to a map
/// and destruct it back from the map.

class PharmacyModel {
  int pharmid;
  String name;
  String location;
  Float lat;
  Float lon;
  int stars;

  PharmacyModel(
      {this.pharmid, this.name, this.location, this.lat, this.lon, this.stars});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'pharm_id': pharmid,
      'name': name,
      'location': location,
      'lat': lat,
      'lon': lon,
      'stars': stars
    };
    return map;
  }

  PharmacyModel.fromMap(Map<String, dynamic> map) {
    pharmid = map['pharm_id'];
    name = map['name'];
    location = map['location'];
    lat = map['lat'];
    lon = map['lon'];
    stars = map['stars'];
  }
}
