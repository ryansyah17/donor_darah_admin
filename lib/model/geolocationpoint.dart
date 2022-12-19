import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class GeoLocation {
  GeoPoint userlocation = GeoPoint.createZeroPoint();

  GeoPoint centerlocation = GeoPoint.createZeroPoint();
  GeoPoint outerlocation = GeoPoint.createNullPoint();
  double radiuscentermeters = 0.0;
  bool isInRange = false;

  //constructor
  GeoLocation({required userlocation});

  GeoLocation.createZeroUserPoint() {
    userlocation = GeoPoint.createZeroPoint();
  }

  GeoLocation.createUserPoint(double lat, double long) {
    setPointUser(lat, long);
  }

  GeoLocation.createUserPointLocationData(LocationData loc) {
    setPointUser(loc.latitude!, loc.longitude!);
  }

  GeoLocation.fromJson(Map<String, dynamic> json) {
    setPointUser(json['latitude'], json['longitude']);
  }

  //setter
  void setPointUserLocationData(LocationData loc) {
    setPointUser(loc.latitude!, loc.longitude!);
  }

  void setPointUser(double lat, double long) {
    userlocation.setPoint(lat, long);
    _calculateRadiusMetersAndInRange();
  }

  void setPointOuterLocationData(LocationData loc) {
    setPointOuter(loc.latitude!, loc.longitude!);
  }

  void setPointOuter(double lat, double long) {
    outerlocation.setPoint(lat, long);
    _calculateRadiusMetersAndInRange();
  }

  void setPointCenterLocationData(LocationData loc) {
    setPointCenter(loc.latitude!, loc.longitude!);
  }

  void setPointCenter(double lat, double long) {
    centerlocation.setPoint(lat, long);
    _calculateRadiusMetersAndInRange();
  }

  set setRadius(double radiusmeters) {
    radiuscentermeters = radiusmeters;
    _calculateInRange();
  }

  //measure
  double distanceUserFromCenter() {
    return centerlocation.distanceWith(userlocation);
  }

  double distanceOuterFromCenter() {
    return centerlocation.distanceWith(outerlocation);
  }

  double distanceUserFromOuter() {
    double radius = distanceUserFromCenter() - distanceOuterFromCenter();
    return radius < 0 ? -radius : radius;
  }

  //calculation
  void _calculateRadiusMetersAndInRange() {
    if (radiuscentermeters == 0.0) _calculateRadiusMeters();
    _calculateInRange();
  }

  void _calculateRadiusMeters() {
    if (outerlocation.latitude != null && outerlocation.longitude != null) {
      radiuscentermeters = distanceOuterFromCenter();
    }
  }

  void _calculateInRange() {
    isInRange = radiuscentermeters >= distanceUserFromCenter();
  }
}

class GeoPoint {
  double? latitude;
  double? longitude;

  GeoPoint({required latitude, required longitude});

  GeoPoint.createNullPoint() {
    latitude = null;
    longitude = null;
  }

  GeoPoint.createZeroPoint() {
    latitude = 0.0;
    longitude = 0.0;
  }

  void setPoint(double lat, double long) {
    latitude = lat;
    longitude = long;
  }

  double distanceWith(GeoPoint otherpoint) {
    return GeolocatorPlatform.instance.distanceBetween(
        latitude!, longitude!, otherpoint.latitude!, otherpoint.longitude!);
  }
}
