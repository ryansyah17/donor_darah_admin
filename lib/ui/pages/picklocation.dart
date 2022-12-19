import 'dart:async';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationAlamat extends StatefulWidget {
  // final Address? address;

  const LocationAlamat({
    Key? key,
  }) : super(key: key);
  @override
  _LocationAlamatState createState() => _LocationAlamatState();
}

class _LocationAlamatState extends State<LocationAlamat> {
//

//
  final Completer<GoogleMapController> _controller = Completer();
  // LocationData? currentLocation;
  final List<Marker> _markers = [];
  String? lokasi;
  String? alamat, kecamatan, kabupaten, provinsi;
  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  @override
  void initState() {
    super.initState();

    location = Location();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      // updatePinsOnMap();
    });

    setInitialLocation();
  }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });
  }

  double? lt, lg;
  double? mylt, mylg;
  @override
  Widget build(BuildContext context) {
    // var userLocation = Provider.of<GeoLocation>(context);
    // mylt = userLocation.userlocation.latitude;
    // mylg = userLocation.userlocation.longitude;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              currentLocation == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      zoomControlsEnabled: false,
                      onCameraMoveStarted: () {
                        print('start moving');
                      },
                      minMaxZoomPreference: MinMaxZoomPreference(10, 30),
                      initialCameraPosition: CameraPosition(
                          target: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                          zoom: 15),
                      onMapCreated: (mapController) {
                        _controller.complete(mapController);
                      },
                      onLongPress: (l) async {
                        setState(() {});
                        _markers.add(Marker(
                            markerId: MarkerId('myMarket-id'),
                            draggable: false,
                            infoWindow: InfoWindow(
                              title: 'Lokasi di Pilih',
                              snippet: 'Latitude : ' +
                                  l.latitude.toString() +
                                  ' Longitude : ' +
                                  l.longitude.toString(),
                            ),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen),
                            position: LatLng(l.latitude, l.longitude)));

                        List<geocoding.Placemark> newPlace = await geocoding
                            .placemarkFromCoordinates(l.latitude, l.longitude);
                        geocoding.Placemark placemark = newPlace[0];
                        alamat =
                            '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode}, ${placemark.country}';
                        kabupaten = '${placemark.subAdministrativeArea}';
                        provinsi = '${placemark.administrativeArea}';
                        kecamatan = '${placemark.locality}';
                        print(newPlace);
                        lt = l.latitude;
                        lg = l.longitude;
                      },
                      onTap: (l) async {},
                      markers: Set.from(_markers)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            // padding: EdgeInsets.symmetric
                            color: Color(0xFF38DA77).withOpacity(0.3),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: Colors.black45,
                                ),
                                Text("Tap Lama Untuk Menandai Lokasi"),
                              ],
                            )),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(70, 40, 30, 20),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Text(
                                          (lt == null)
                                              ? 'Pilih Lokasi Anda'
                                              : '${alamat}',
                                          maxLines: 3,
                                          // style: blackFontStyle1.copyWith(
                                          //     fontSize: 2 * sp)
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                  // margin: EdgeInsets.fromLTRB(
                                  //     5 * w, 0, 5 * w, 1.3 * h),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        // backgroundColor:
                                        //     MaterialStateProperty.all<Color>(
                                        //         mainGreen2),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                      ),
                                      onPressed: () {
                                        // SubLayanan(titip_map: lt.toString());
                                        Map<String, dynamic>? alamatUmum = {
                                          // 'titik': '' +
                                          //     lt.toString() +
                                          //     '#' +
                                          //     lg.toString(),
                                          'latitude': lt.toString(),
                                          'longitude': lg.toString(),
                                          'alamat': alamat,
                                          'kecamatan': kecamatan,
                                          'kabupaten': kabupaten,
                                          'provinsi': provinsi,
                                        };
                                        Get.back(result: alamatUmum);
                                        // print(SubLayanan(
                                        //     titip_map: lt.toString()));
                                      },
                                      child: Text(
                                        'Konfirmasi',
                                      )))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 38, 0, 0),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
