import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/commonWidget/text_field_widget.dart';

import '../../../../commonWidget/block_button_widget.dart';
import '../../../routes/app_routes.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getFcmToken();
    controller.loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            color: AppColors.maincolor,
            height: 892,
            width: 412,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    "assets/icon/logo.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 180.0,
              left: 40.0,
              right: 40.0,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.white,
                child: SizedBox(
                  width: 326.0,
                  height: 533.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 20),
                    child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: AppColors.maincolor,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Welcome back. Enter your credentials to access your account",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              hintText: "johndoe@gmail.com",
                              labelText: "Email Address",
                              initialValue: controller.currentUser!.value.email,
                              onSaved: (input) =>
                                  controller.currentUser!.value.email = input!,
                              validator: (input) => !input!.contains('@')
                                  ? "Should be a valid email".tr
                                  : null,
                              isFirst: false,
                              isLast: false,
                              iconData: Icons.alternate_email,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() {
                              return TextFieldWidget(
                                hintText: "••••••••••",
                                labelText: "Password",
                                initialValue:
                                    controller.currentUser!.value.password,
                                onSaved: (input) => controller
                                    .currentUser!.value.password = input!,
                                validator: (input) => input!.length < 6
                                    ? "Should be more than 6 characters".tr
                                    : null,
                                iconData: Icons.alternate_email,
                                obscureText: controller.loginHidePassword.value,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.loginHidePassword.value =
                                        !controller.loginHidePassword.value;
                                  },
                                  color: Theme.of(context).focusColor,
                                  icon: Icon(controller.loginHidePassword.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              );
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: AppColors.greencolr,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: true,
                            //       onChanged: (value) {},
                            //     ),
                            //     const Text(
                            //       "Keep me signed in",
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.normal,
                            //         fontFamily: "Montserrat",
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            Obx(() {
                              return controller.loginLoading == false
                                  ? BlockButtonWidget(
                                      onPressed: () async {
                                        await controller.login();
                                      },
                                      color: AppColors.maincolor,
                                      text: Text(
                                        "Continue".tr,
                                        style: Get.textTheme.titleMedium!
                                            .merge(const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Montserrat",
                                        )),
                                      ),
                                    ).paddingSymmetric(vertical: 5.0)
                                  : const Align(
                                      alignment: Alignment
                                          .center, // Center the CircularProgressIndicator
                                      child: SizedBox(
                                        width:
                                            30, // Adjust the width to your desired value
                                        height: 40,
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 2.0,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                                const Text(
                                  "   or   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Container(
                                  height: 2.0,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            BlockButtonWidget(
                              onPressed: () {
                                Get.toNamed(Routes.HOMEPAGE);
                              },
                              color: AppColors.buttoncolr,
                              text: Text(
                                "Continue as Guest".tr,
                                style: Get.textTheme.titleMedium!
                                    .merge(const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Don't have an Account? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat",
                                    fontSize: 13,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child: Text(
                                    "Sign up here",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      color: AppColors.greencolr,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
