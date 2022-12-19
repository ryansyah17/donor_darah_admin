import 'package:admin_donor_darah/model/notifikasi.dart';
import 'package:admin_donor_darah/services/notification_services.dart';
import 'package:admin_donor_darah/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  bool _pinned = true;

  bool _floating = false;

  final NotificationServices notifications = NotificationServices();
  @override
  void iniState() {
    super.initState();
    notifications.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primer,
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                  onTap: () {
                    print("object");
                    notifications.getNotification();
                    setState(() {});
                  },
                  child: const Icon(Icons.refresh)))
        ],
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
            future: notifications.getNotification(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Notifications>> snapshot) {
              if (snapshot.hasData) {
                List<Notifications> listNotification = snapshot.data!;
                return ListView(
                    children: listNotification
                        .map((e) => _notificationcard(e))
                        .toList());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget _notificationcard(Notifications notifications) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 5)],
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.airline_seat_flat,
                    size: 40,
                  ),
                ),
                Container(
                  width: 3,
                  height: 120,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Nama         :',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            notifications.name!,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Gol. Darah :',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            notifications.goldarah!,
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 5),
                            child: Icon(
                              Icons.bloodtype_outlined,
                              size: 20,
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '               :',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            notifications.kebutuhanDarah!,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Kantong',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'lokasi          : ',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            notifications.alamat!,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Kontak        : ',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            notifications.kontak!,
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
