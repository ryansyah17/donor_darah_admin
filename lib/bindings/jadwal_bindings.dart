import 'package:admin_donor_darah/controllers/input_jadwal_controller.dart';
import 'package:get/get.dart';

class InputNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalController>(() => JadwalController());
  }
}
