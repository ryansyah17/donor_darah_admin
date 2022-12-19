import 'package:admin_donor_darah/ui/pages/notifikasipage.dart';
import 'package:admin_donor_darah/ui/pages/pendonorpage.dart';
import 'package:admin_donor_darah/ui/pages/stokdarahpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool _pinned = true;
  bool _floating = false;
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Informasi',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: '630000'.toColor(),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StokDarahPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/128/943/943579.png'),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        // color: Colors.black,
                                        child: Text(
                                          'Ketersediaan\nStok Darah',
                                          style: GoogleFonts.poppins(
                                                  color: "630000".toColor(),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          18,
                                                  fontWeight: FontWeight.w500)
                                              .copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PendonorPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/128/943/943579.png'),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Daftar Nama\nPendonor',
                                          style: GoogleFonts.poppins(
                                              color: "630000".toColor(),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotifikasiPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://cdn-icons-png.flaticon.com/128/943/943579.png'),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Notifikasi Masuk',
                                          style: GoogleFonts.poppins(
                                              color: "630000".toColor(),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
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
