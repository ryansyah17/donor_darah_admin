import 'package:admin_donor_darah/controllers/input_jadwal_controller.dart';
import 'package:admin_donor_darah/model/jadwal.dart';
import 'package:admin_donor_darah/services/jadwal_services.dart';
import 'package:admin_donor_darah/shared/shared.dart';
import 'package:admin_donor_darah/ui/pages/picklocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputAlamatPage extends GetView<JadwalController> {
  const InputAlamatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titik;

    void _navigateLocation(BuildContext context) async {
      titik = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => LocationAlamat()));
      if (titik != null) {
        controller.latitude.text = titik['latitude'];
        controller.longitude.text = titik['longitude'];
        controller.location.text = titik['alamat'];
        print(titik); // call your own function here to refresh screen
      }
    }

    final inputjadwal = Get.find<JadwalServices>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Jadwal'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('namestand'),
                    controller: controller.nameStand,
                    keyboardType: TextInputType.name,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'Nama Stand',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('waktu'),
                    controller: controller.waktu,
                    keyboardType: TextInputType.name,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'Waktu',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('gambar'),
                    controller: controller.picture,
                    keyboardType: TextInputType.name,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'picture',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('latitude'),
                    readOnly: true,
                    controller: controller.latitude,
                    keyboardType: TextInputType.name,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'latitude',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('longitude'),
                    readOnly: true,
                    controller: controller.longitude,
                    keyboardType: TextInputType.name,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'longitude',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextFormField(
                    key: ValueKey('location'),
                    controller: controller.location,
                    keyboardType: TextInputType.name,
                    maxLines: 4,
                    readOnly: true,
                    style: blackFontStyle2,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'Tanggal Donor',
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^.{4,}$');
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Nama tidak valid (Min. 4 karakter)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _navigateLocation(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.green,
                        )),
                    child: Center(
                      child: Text(
                        'Buka Peta',
                        style: GoogleFonts.poppins(
                            color: Colors.green, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (controller.nameStand.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.waktu.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.picture.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.latitude.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.longitude.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else if (controller.location.text.isEmpty) {
                          Get.snackbar(
                            "Field Required",
                            "Nama Harus Diinputkan",
                            colorText: Colors.white,
                            backgroundColor: Colors.red[300],
                            icon: Icon(Icons.warning, color: Colors.red),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          Jadwal j = Jadwal(
                            nameStand: controller.nameStand.text,
                            waktu: controller.waktu.text,
                            picture: controller.picture.text,
                            location: controller.location.text,
                            latitude: controller.latitude.text,
                            longitude: controller.longitude.text,
                          );
                          inputjadwal.createJadwal(j: j);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(blurRadius: 5),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
