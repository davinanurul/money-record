import 'package:d_view/d_view.dart';
import 'package:davina_money_record/config/app_asset.dart';
import 'package:davina_money_record/presentation/page/auth/register_page.dart';
import 'package:flutter/material.dart';

import 'package:davina_money_record/data/souce/source_user.dart';
import 'package:d_info/d_info.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bool success =
          await SourceUser.login(controllerEmail.text, controllerPassword.text);

      if (success) {
        DInfo.dialogSuccess('Berhasil Login');
      } else {
        DInfo.dialogError('Gagal Login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // DView.height(50),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(AppAsset.logo1),
                  ),
                  DView.height(5),
                  const Text(
                    'Money Tracker',
                    style: TextStyle(
                      color: Color(0xFF2E475F),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DView.height(20),
                  TextFormField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFF2E475F)),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  DView.height(20),
                  TextFormField(
                    controller: controllerPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFF2E475F)),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  DView.height(20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ElevatedButton(
                        onPressed: () => login(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF2E475F)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DView.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum Punya Akun? ",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const RegisterPage());
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E475F),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
