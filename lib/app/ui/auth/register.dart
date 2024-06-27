import 'package:cpms_app/app/controllers/login_controller.dart';
import 'package:cpms_app/app/controllers/sign_in_controller.dart';
import 'package:cpms_app/app/ui/auth/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<SignInController> {
  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
        appBar: AppBar(title: Text('Register Yourself')),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Create a COICT Fault Management System Account"),
                            sizedBox,
                            Text("Please enter your credentials"),
                            sizedBox,
                            profile(
                              title: "Name",
                              subtitle: "Enter your name",
                              controller: controller.name.value,
                            ),
                            sizedBox,
                            profile(
                              title: "Phone",
                              subtitle: "Enter your phone",
                              controller: controller.phone.value,
                            ),
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
                            DropdownButton<String>(
                              // value: controller.type.value,
                              isExpanded: true,
                              hint: Text(
                                "Select a role ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              items: controller.roles.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {
                                controller.role.value = _!;
                                print("Debug" + _);
                              },
                            ),
                            sizedBox,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                onPressed: () => controller.submit(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 30, right: 30),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )))));
  }
}
