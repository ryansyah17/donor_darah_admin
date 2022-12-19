import 'dart:convert';

import 'package:admin_donor_darah/model/stokdarah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listStokDarah = <Data>[].obs;

class StokdarahService {
  String baseUrl = 'http://34.227.139.129/api/stokdarah/stokdarah';

  Future<List<Data>> getStokdarah() async {
    listStokDarah.clear();
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
      List<Data> stokDarah = [];

      datalist.map((e) => stokDarah.add(Data.fromJson(e))).toList();

      print(stokDarah[0]);
      listStokDarah.value = stokDarah;
      listStokDarah.refresh();

      return stokDarah;
    } else {
      throw Exception('Gagal mengambil data darah');
    }
  }
}
