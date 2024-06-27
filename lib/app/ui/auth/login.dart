import 'package:cpms_app/app/controllers/login_controller.dart';
import 'package:cpms_app/app/ui/auth/register.dart';
import 'package:cpms_app/app/ui/auth/widgets/profile.dart';
import 'package:cpms_app/app/ui/maintanance/maintenance.dart';
// import 'package:cpms_app/app/ui/maintanance/maintenance.dart';
import 'package:cpms_app/app/ui/report/report.dart';
// import 'package:cpms_app/app/ui/report/report.dart';
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Welcome to"),
                          sizedBox,
                          Text(
                            "CoICT Fault Management System",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19.0),
                          ),
                          sizedBox,
                          Text("Please login to your account"),
                          sizedBox,
                          profile(
                            title: "Email",
                            subtitle: "Enter your email",
                            controller: controller.email.value,
                          ),
                          sizedBox,
                          profile(
                              title: "Password",
                              subtitle: "Enter your password",
                              controller: controller.password.value),
                          sizedBox,
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              onPressed: () => controller.submit(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 30, right: 30),
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          sizedBox,
                          Text("OR"),
                          sizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("If you dont have an account"),
                              InkWell(
                                onTap: () {
                                  // Replace with your navigation code
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                },
                                child: Text(
                                  " Sign in here",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )))),
    ));
  }
}
