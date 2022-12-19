import 'dart:convert';

import 'package:admin_donor_darah/model/pendonor.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listPendonor = <Pendonor>[].obs;

class PendonorServices {
  String baseUrl = 'http://34.227.139.129/api/pendonor/pendonor';

  Future<List<Pendonor>> getPendonor() async {
    listPendonor.clear();
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
      List<Pendonor> pendonor = [];

      datalist.map((e) => pendonor.add(Pendonor.fromJson(e))).toList();

      print(pendonor[0]);
      listPendonor.value = pendonor;
      listPendonor.refresh();

      return pendonor;
    } else {
      throw Exception('Gagal mengambil data pendonor');
    }
  }

  // void createPendonor(Pendonor p) async {
  //   var url = Uri.parse(baseUrl);
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = jsonEncode(p.toJson());

  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body,
  //   );
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     getPendonor();
  //     Get.back();
  //   } else {
  //     Get.snackbar("Failed", "Gagal Menambahkan Data");
  //   }
  // }
}
