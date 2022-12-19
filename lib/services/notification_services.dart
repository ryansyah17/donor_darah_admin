import 'dart:convert';

import 'package:admin_donor_darah/model/notifikasi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

var listNotification = <Notifications>[].obs;

class NotificationServices extends GetxController {
  String baseUrl = 'http://34.227.139.129/api/notification/notification';

  void createNotification(Notifications p) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(p.toJson());

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    if (response.statusCode <= 210 && response.statusCode >= 200) {
      getNotification();
      Get.back();
    } else {
      Get.snackbar("Failed", "Gagal Menambahkan Data");
    }
  }

  Future<List<Notifications>> getNotification() async {
    listNotification.clear();
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
      List<Notifications> notification = [];

      datalist.map((e) => notification.add(Notifications.fromJson(e))).toList();

      print(notification[0]);
      listNotification.value = notification;
      listNotification.refresh();

      return notification;
    } else {
      throw Exception('Gagal mengambil data darah');
    }
  }
}
