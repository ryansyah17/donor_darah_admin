import 'package:admin_donor_darah/controllers/input_jadwal_controller.dart';
import 'package:admin_donor_darah/services/auth_services.dart';
import 'package:admin_donor_darah/services/jadwal_services.dart';
import 'package:admin_donor_darah/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final inputjadwal = Get.put(JadwalServices(), permanent: true);

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<JadwalController>(() => JadwalController());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        // ChangeNotifierProvider(create: (_) => JadwalServices()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
