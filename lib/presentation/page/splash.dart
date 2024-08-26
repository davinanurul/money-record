import 'dart:async';
import 'package:davina_money_record/config/app_asset.dart';
import 'package:davina_money_record/presentation/page/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Tunggu selama 3 detik, kemudian navigasi ke halaman Home.
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 88, 125, 159),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppAsset.logo1, // Menggunakan path dari asset.dart
              width: 150, // Sesuaikan lebar gambar
              height: 150, // Sesuaikan tinggi gambar
            ),
            const SizedBox(height: 20),
            const Text(
              'Money Tracker',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 253, 253, 253),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
