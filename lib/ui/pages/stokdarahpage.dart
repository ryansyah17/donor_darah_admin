import 'dart:async';
// import 'dart:convert';

import 'package:admin_donor_darah/model/stokdarah.dart';
import 'package:admin_donor_darah/services/stokdarah_services.dart';
import 'package:admin_donor_darah/ui/pages/informationpage.dart';
import 'package:admin_donor_darah/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StokDarahPage extends StatefulWidget {
  @override
  State<StokDarahPage> createState() => _StokDarahPageState();
}

class _StokDarahPageState extends State<StokDarahPage> {
  final StokdarahService service = StokdarahService();
  // late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    service.getStokdarah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                  onTap: () {
                    print("object");
                    service.getStokdarah();
                    setState(() {});
                  },
                  child: Icon(Icons.refresh)))
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            initialPage: 1,
                          )));
            },
            child: Icon(Icons.arrow_back_ios_sharp)),
        title: Text(
          "Stok Darah",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
          future: service.getStokdarah(),
          builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
            if (snapshot.hasData) {
              List<Data> listStokDarah = snapshot.data!;
              return ListView(
                  children:
                      listStokDarah.map((e) => _cardstokdarah(e)).toList());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  // Widget _stokdarah() {
  //   return Column(
  //       children:
  //           listStokDarah.map((element) => _cardstokdarah(element)).toList());
  // }

  Widget _cardstokdarah(Data stokdarah) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            height: 100,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black45, width: 1.5)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/3127/3127109.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Text(
                    'Gol.Darah A',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${stokdarah.goldarahA.toString()} kntg',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            height: 100,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black45, width: 1.5)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/3127/3127109.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Text(
                    'Gol.Darah B',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${stokdarah.goldarahB.toString()} kntg',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            height: 100,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black45, width: 1.5)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/3127/3127109.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Text(
                    'Gol.Darah AB',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${stokdarah.goldarahAb.toString()} kntg',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            height: 100,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black45, width: 1.5)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/3127/3127109.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Text(
                    'Gol.Darah O',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${stokdarah.goldarahO.toString()} kntg',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
