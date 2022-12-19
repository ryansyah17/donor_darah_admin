import 'package:admin_donor_darah/services/auth_services.dart';
import 'package:admin_donor_darah/shared/shared.dart';
import 'package:admin_donor_darah/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Assets/blood-drop.png'),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Selamat Datang Admin,',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login ke Akun Anda untuk lanjut',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: email,
                        key: const ValueKey('email'),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        style: blackFontStyle2,
                        decoration: const InputDecoration(
                          hintText: 'email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        validator: (value) {
                          // Reg Expression Email validator
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value!)) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: defaultMargin * 2),
                            child: const Text(
                              'Password',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: password,
                        key: const ValueKey('password'),
                        style: blackFontStyle2,
                        obscureText: _obscureText,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: blackFontStyle3,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Password tidak valid (Min. 6 karakter)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: primer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              if (email.text.isEmpty || password.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'Tidak boleh kosong',
                                      textAlign: TextAlign.center,
                                      style: whiteFontStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                await context
                                    .read<AuthService>()
                                    .login(
                                      email: email.text,
                                      password: password.text,
                                    )
                                    .then(
                                      (value) => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => MainPage(
                                                    initialPage: 0,
                                                  ))),
                                    )
                                    .catchError(
                                  (e) {
                                    print(e.toString());
                                  },
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
