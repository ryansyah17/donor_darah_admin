// import 'package:admin_donor_darah/model/geolocationpoint.dart';
// import 'package:admin_donor_darah/services/auth_services.dart';
import 'package:admin_donor_darah/ui/pages/inputjadwalpage.dart';
import 'package:admin_donor_darah/ui/pages/settings_page.dart';
import 'package:admin_donor_darah/ui/widgets/cache_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart' as locationv2;
import 'package:geocoding/geocoding.dart';
import 'package:trust_location/trust_location.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  locationv2.Location lokasi = locationv2.Location();
  double _latitude = 0;
  double _longitude = 0;
  String? _address;
  bool isLoading = true;
  final MapController _mapController = MapController();

  @override
  void initState() {
    requestPermission();

    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> requestPermission() async {
    bool serviceEnabled;
    locationv2.PermissionStatus permissionGranted;
    serviceEnabled = await lokasi.serviceEnabled();

    //ceck service
    if (!serviceEnabled) {
      serviceEnabled = await lokasi.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    //ceck permission
    permissionGranted = await lokasi.hasPermission();
    if (permissionGranted == locationv2.PermissionStatus.denied) {
      permissionGranted = await lokasi.requestPermission();
      if (permissionGranted != locationv2.PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  Future<void> getLocation() async {
    final hasPermisson = await requestPermission();
    if (!hasPermisson) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Permission Denied'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const [
                    Text(
                        "Tanpa izin penggunaan lokasi aplikasi ini tidak dapat digunakan dengan baik. Apa anda yakin menolak izin pengaktifan lokasi?",
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('COBA LAGI'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    requestPermission();
                  },
                ),
                TextButton(
                  child: const Text('SAYA YAKIN'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      //get Location
      TrustLocation.start(5);
      try {
        TrustLocation.onChange.listen((values) {
          var mockStatus = values.isMockLocation;
          if (mockStatus == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Fake GPS terdeteksi. Mohon non aktifkan fitur Fake GPS Anda'),
            ));
            TrustLocation.stop();
            return;
          }

          if (mounted) {
            setState(() {
              isLoading = false;
              _latitude = double.parse(values.latitude.toString());
              _longitude = double.parse(values.longitude.toString());

              _mapController.move(LatLng(_latitude, _longitude), 13);

              getPlace();
            });
          }
        });
      } on PlatformException catch (e) {
        debugPrint('PlatformException $e');
      }
    }
  }

  void getPlace() async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(_latitude, _longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name.toString();
    String subLocality = placeMark.subLocality.toString();
    String locality = placeMark.locality.toString();
    String administrativeArea = placeMark.administrativeArea.toString();
    String postalCode = placeMark.postalCode.toString();
    String country = placeMark.country.toString();
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

    setState(() {
      _address = address; // update _address
    });
  }

  Widget displayMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(_latitude, _longitude),
        zoom: 15,
        maxZoom: 19,
      ),
      layers: [
        MarkerLayerOptions(
          rotate: true,
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(_latitude, _longitude),
              anchorPos: AnchorPos.align(AnchorAlign.top),
              builder: (ctx) => const Icon(
                Icons.fmd_good,
                color: Colors.redAccent,
                size: 20.0,
              ),
            ),
          ],
        ),
      ],
      children: [
        TileLayerWidget(
          options: TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            tileProvider: CachedTileProvider(),
            subdomains: ['a', 'b', 'c'],
            maxZoom: 19,
          ),
        )
      ],
    );
  }

  bool _pinned = true;
  bool _floating = false;
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: _floating,
                floating: false,
                flexibleSpace: Container(),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                expandedHeight: 60,
                shadowColor: Colors.transparent,
                pinned: _pinned,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beranda',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              width: 95,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: '630000'.toColor(),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                          },
                          child: const Icon(
                            Icons.settings,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('Assets/blood.jpg'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    '',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    ''
                                    // user.email!
                                    ,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: screenSize.height / 7,
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20, top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Visibility(
                                visible: isLoading ? true : false,
                                child: const CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              isLoading
                                  ? const Text("Sedang mencari lokasi ...")
                                  :
                                  // : Text(
                                  //     "Lokasi anda adalah \n: Lat : $_latitude \nLong : $_longitude"),
                                  Text("Alamat : \n$_address",
                                      textAlign: TextAlign.center),
                              const SizedBox(height: 20),
                              // Visibility(
                              //   visible: isLoading ? false : true,
                              //   child: ElevatedButton.icon(
                              //       style: ElevatedButton.styleFrom(
                              //         primary: Colors.lightBlue,
                              //       ),
                              //       onPressed: () {
                              //         setState(() {
                              //           isLoading = true;
                              //           _address = "";
                              //         });
                              //         getLocation();
                              //       },
                              //       icon: const Icon(
                              //           Icons.my_location_outlined),
                              //       label: const Padding(
                              //         padding: EdgeInsets.all(15.0),
                              //         child: Text("Refres Lokasi",
                              //             style: TextStyle(fontSize: 16)),
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: screenSize.height / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: displayMap(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        // color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InputAlamatPage()));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 150,
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(blurRadius: 5)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      // width: 80,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/128/5073/5073415.png')),
                                      ),
                                    ),
                                    Text(
                                      'Buat Jadwal',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: "630000".toColor(),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     margin:
                            //         const EdgeInsets.symmetric(vertical: 10),
                            //     height: 150,
                            //     width: MediaQuery.of(context).size.width / 2.3,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(8),
                            //         color: Colors.white,
                            //         boxShadow: const [
                            //           BoxShadow(blurRadius: 5)
                            //         ]),
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           height: 100,
                            //           margin: const EdgeInsets.symmetric(
                            //               vertical: 10),
                            //           // width: 80,
                            //           decoration: const BoxDecoration(
                            //             image: DecorationImage(
                            //                 image: NetworkImage(
                            //                     'https://cdn-icons-png.flaticon.com/128/5073/5073415.png')),
                            //           ),
                            //         ),
                            //         Text(
                            //           'Notif Ambil Darah',
                            //           style: GoogleFonts.poppins(
                            //               fontSize: 18,
                            //               color: "630000".toColor(),
                            //               fontWeight: FontWeight.w500),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Container(
                      //         margin: const EdgeInsets.symmetric(vertical: 10),
                      //         height: 150,
                      //         width: MediaQuery.of(context).size.width / 2.3,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(8),
                      //             color: Colors.white,
                      //             boxShadow: const [BoxShadow(blurRadius: 5)]),
                      //         child: Column(
                      //           children: [
                      //             Container(
                      //               height: 100,
                      //               margin: const EdgeInsets.symmetric(
                      //                   vertical: 10),
                      //               // width: 80,
                      //               decoration: const BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: NetworkImage(
                      //                         'https://cdn-icons-png.flaticon.com/128/5073/5073415.png')),
                      //               ),
                      //             ),
                      //             Text(
                      //               'ON going',
                      //               style: GoogleFonts.poppins(
                      //                   fontSize: 18,
                      //                   color: "630000".toColor(),
                      //                   fontWeight: FontWeight.w500),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ]))
            ],
          ))
        ],
      ),
    );
  }
}
