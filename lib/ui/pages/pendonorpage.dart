// import 'package:admin_donor_darah/ui/pages/main_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PendonorPage extends StatelessWidget {
//   const PendonorPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => MainPage(
//                             initialPage: 1,
//                           )));
//             },
//             child: Icon(Icons.arrow_back_ios)),
//         title: Text('Daftar Nama Pendonor',
//             style:
//                 GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
//       ),
//       body: Stack(
//         children: <Widget>[
//           _daftarpendonor(),
//         ],
//       ),
//     );
//   }

//   Widget _daftarpendonor() {
//     return Builder(builder: ((context) {
//       return SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               // margin: EdgeInsets.symmetric(horizontal: 10),
//               width: MediaQuery.of(context).size.width,
//               height: 180,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black45),
//                   // borderRadius: BorderRadius.only(
//                   //     bottomLeft: Radius.circular(15),
//                   //     bottomRight: Radius.circular(15)),
//                   image: DecorationImage(
//                       image: AssetImage('Assets/blood.jpg'),
//                       fit: BoxFit.cover)),
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 20),
//                   child: Icon(
//                     Icons.integration_instructions,
//                     color: Colors.red,
//                     size: 30,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(5),
//                   height: 60,
//                   width: MediaQuery.of(context).size.width - 80,
//                   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   decoration: BoxDecoration(
//                       // color: Colors.red,
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(width: 1)),
//                   child: Text(
//                     'CLICK PADA NAMA PENDONOR UNTUK MELIHAT \nINFO LEBIH LANJUT!',
//                     style: GoogleFonts.poppins(
//                         fontSize: 15, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: 15,
//                 left: 20,
//               ),
//               height: 60,
//               width: MediaQuery.of(context).size.width - 40,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                   border: Border.all(width: 1.5, color: Colors.black45)),
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 10),
//                     child: Text(
//                       'Agus Samsudin',
//                       style: GoogleFonts.poppins(
//                           fontSize: 20, fontWeight: FontWeight.w500),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }));
//   }
// }

import 'package:admin_donor_darah/model/pendonor.dart';
import 'package:admin_donor_darah/services/pendonor_services.dart';
import 'package:flutter/material.dart';

class PendonorPage extends StatefulWidget {
  @override
  State<PendonorPage> createState() => _PendonorPageState();
}

class _PendonorPageState extends State<PendonorPage> {
  final PendonorServices daftar = PendonorServices();

  @override
  void initState() {
    super.initState();
    daftar.getPendonor();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pendonor'),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                  onTap: () {
                    print("object");
                    daftar.getPendonor();
                    setState(() {});
                  },
                  child: Icon(Icons.refresh)))
        ],
      ),
      body: FutureBuilder(
          future: daftar.getPendonor(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pendonor>> snapshot) {
            if (snapshot.hasData) {
              List<Pendonor> listPendonor = snapshot.data!;
              return ListView(
                  children: listPendonor.map((e) => _cardPendonor(e)).toList());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      // body:
    );
  }
}

Widget _cardPendonor(
  Pendonor pendonors,
) {
  return Builder(builder: (context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          children: [
            Container(
              // color: Colors.blueGrey,
              height: 400 * 0.7,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double innerHeight = constraints.maxHeight;
                  double innerWidth = constraints.maxWidth;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 10,
                        child: Container(
                          height: innerHeight * 0.72,
                          width: innerWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent,
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 15),
                                      child: const Text(
                                        'Nama',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 76, top: 15),
                                      child: const Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 15),
                                      child: Text(
                                        pendonors.name!.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Tmpt Lahir',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 37, top: 5),
                                      child: const Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.tempatLahir!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Tggl Lahir',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 45, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.tanggalLahir!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Jenis Kelamin',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 11, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.jenisKelamin!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Alamat',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 70, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      width: 200,
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.alamat!,
                                        style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'No Hp',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 77, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.nohp!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Gol.Darah',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 49, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.goldarah!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        'Tggl Donor',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 40, top: 5),
                                    child: const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.tanggalDonor!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.only(
                                            left: 40, top: 5),
                                        child: const Text(
                                          'BB',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.beratbadan!.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      width: 3,
                                      height: 20,
                                      color: Colors.black,
                                    ),
                                    Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: const Text(
                                          'TK',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.tekanandarah!.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      width: 3,
                                      height: 20,
                                      color: Colors.black,
                                    ),
                                    Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: const Text(
                                          'HB',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: const Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        pendonors.kadarhb!.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      width: 3,
                                      height: 20,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  });
}
