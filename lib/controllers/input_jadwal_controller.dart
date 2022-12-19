import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  late TextEditingController nameStand;
  late TextEditingController waktu;
  late TextEditingController latitude;
  late TextEditingController longitude;
  late TextEditingController picture;
  late TextEditingController location;

  @override
  void onInit() {
    super.onInit();
    nameStand = TextEditingController();
    waktu = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
    picture = TextEditingController();
    location = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameStand.dispose();
    waktu.dispose();
    latitude.dispose();
    longitude.dispose();
    picture.dispose();
    location.dispose();
  }
}
