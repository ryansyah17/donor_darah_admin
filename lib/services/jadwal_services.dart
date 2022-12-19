import 'dart:convert';

import 'package:admin_donor_darah/model/jadwal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listJadwal = <Jadwal>[].obs;

class JadwalServices extends ChangeNotifier {
  String baseUrl = 'http://34.227.139.129/api/jadwal/jadwal';

  // post
  void createJadwal({
    // required String nameStand,
    // required String waktu,
    // required String location,
    // required String latitude,
    // required String longitude,
    // required String picture,
    Jadwal? j,
  }) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(j!.toJson()
        //   {
        //   'nameStand': nameStand,
        //   'waktu': waktu,
        //   'location': location,
        //   'latitude': latitude,
        //   'longitude': longitude,
        //   'picture': picture,
        // }
        );

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    if (response.statusCode <= 210 && response.statusCode >= 200) {
      getJadwal();
      Get.back();
    } else {
      Get.snackbar("Failed", "Gagal Menambahkan Data");
    }
  }

  // get
  Future<List<Jadwal>> getJadwal() async {
    listJadwal.clear();
    var url = Uri.parse(baseUrl);
    var header = {'Content-Type': 'application/json'};
    var response = await http.get(
      url,
      headers: header,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List datalist = data['data'] as List;
      List<Jadwal> jadwal = [];

      // datalist.map((e) => jadwal.add(Jadwal.fromJson(e))).toList();

      print(jadwal[0]);
      listJadwal.value = jadwal;
      listJadwal.refresh();

      return jadwal;
    } else {
      throw Exception('Gagal mengambil data Jadwal');
    }
  }
}
