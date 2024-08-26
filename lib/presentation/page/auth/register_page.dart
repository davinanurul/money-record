import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:davina_money_record/config/app_asset.dart';
import 'package:davina_money_record/data/souce/source_user.dart';
import 'package:davina_money_record/presentation/page/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  register() async {
    if (controllerName.text.isEmpty ||
        controllerEmail.text.isEmpty ||
        controllerPassword.text.isEmpty) {
      // Show snackbar if any field is empty
      DInfo.snackBarError('Harap Lengkapi Data Register');
      return;
    }

    if (formKey.currentState!.validate()) {
      bool success = await SourceUser.register(
        controllerName.text,
        controllerEmail.text,
        controllerPassword.text,
      );

      if (success) {
        DInfo.snackBarSuccess('Berhasil Register');
      } else {
        DInfo.dialogError('Gagal Login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color((0xFF2E475F)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(const LoginPage());
          },
        ),
      ),
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
                    controller: controllerName,
                    decoration: InputDecoration(
                      hintText: 'Name',
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ElevatedButton(
                          onPressed: () => register(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF2E475F)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                        "Sudah punya akun? ",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const LoginPage());
                        },
                        child: const Text(
                          'Login',
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
