import 'package:cpms_app/app/controllers/login_controller.dart';
import 'package:cpms_app/app/ui/auth/register.dart';
import 'package:cpms_app/app/ui/auth/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
        // appBar: AppBar(title: Text('LoginPage')),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back!",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                          Text(
                            "COICT Fault Management System Account",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                          sizedBox,
                          sizedBox,
                          sizedBox,
                          sizedBox,
                          Text("Please login to your account"),
                          sizedBox,
                          profile(
                            title: "Email",
                            subtitle: "Enter your email",
                            controller: controller.email.value,
                          ),
                          Obx(() => Text(
                                controller.emailError.value,
                                style: TextStyle(color: Colors.red),
                              )),
                          sizedBox,
                          profile(
                              title: "Password",
                              subtitle: "Enter your password",
                              controller: controller.password.value),
                          Obx(() => Text(
                                controller.passwordError.value,
                                style: TextStyle(color: Colors.red),
                              )),
                          sizedBox,
                          Obx(() => Text(
                                controller.loginError.value,
                                style: TextStyle(color: Colors.red),
                              )),
                          sizedBox,
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 0.0),
                              onPressed: () => controller.submit(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 30, right: 30),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                          // sizedBox,
                          TextButton(
                            onPressed: () {
                              Get.to(() => RegisterPage());
                            },
                            child: Row(
                              children: [
                                Text(
                                  "I don't have an account? ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text("Register",
                                    style: TextStyle(color: Colors.blue))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )))),
    ));
  }
}
