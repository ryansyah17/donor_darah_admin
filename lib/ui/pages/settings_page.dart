import 'package:admin_donor_darah/services/auth_services.dart';
import 'package:admin_donor_darah/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Setting',
          style: GoogleFonts.poppins(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  'My Profil',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => print('Pol'),
              ),
              ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    context.read<AuthService>().logout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
