import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/routes/app_routes.dart';

import '../../../../commonWidget/block_button_widget.dart';
import '../../../../commonWidget/text_field_widget.dart';
import '../../../services/colors/custom_colors.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.forgotPassword();
    controller.registerFormKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.maincolor,
      body: Form(
        key: controller.registerFormKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: AppColors.maincolor,
                height: 862.0,
                width: 412,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Image.asset(
                        "assets/icon/logo.png",
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 160.0,
                  left: 40.0,
                  right: 40.0,
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.white,
                    child: SizedBox(
                      width: 326.0,
                      height: 650.0,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: AppColors.maincolor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Welcome to Paybox. To create an account enter your credentials.",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat",
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                if (controller.loading.isTrue) {
                                  return const CircularProgressIndicator();
                                } else {
                                  // ignore: prefer_const_constructors
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      TextFieldWidget(
                                        hintText: "Adward James",
                                        labelText: "Name",
                                        initialValue:
                                            controller.currentUser!.value.name,
                                        onSaved: (input) => controller
                                            .currentUser!.value.name = input!,
                                        validator: (input) => input!.length < 3
                                            ? "Should be more than 3 characters"
                                                .tr
                                            : null,
                                        isFirst: true,
                                        isLast: false,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldWidget(
                                        hintText: "johndoe@gmail.com",
                                        labelText: "Email Address",
                                        initialValue:
                                            controller.currentUser!.value.email,
                                        onSaved: (input) => controller
                                            .currentUser!.value.email = input!,
                                        validator: (input) =>
                                            !input!.contains('@')
                                                ? "Should be a valid email".tr
                                                : null,
                                        iconData: Icons.alternate_email,
                                        isFirst: false,
                                        isLast: false,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldWidget(
                                        hintText: "09876543987",
                                        labelText: "Phone Number",
                                        initialValue: controller
                                            .currentUser!.value.telephone,
                                        onSaved: (input) => controller
                                            .currentUser!
                                            .value
                                            .telephone = input!,
                                        isFirst: false,
                                        isLast: false,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Obx(() {
                                        return TextFieldWidget(
                                          labelText: "Password".tr,
                                          hintText: "••••••••••••".tr,
                                          initialValue: controller
                                              .currentUser!.value.password,
                                          onSaved: (input) => controller
                                              .currentUser!
                                              .value
                                              .password = input!,
                                          validator: (input) => input!.length <
                                                  3
                                              ? "Should be more than 3 characters"
                                                  .tr
                                              : null,
                                          obscureText:
                                              controller.hidePassword.value,
                                          iconData: Icons.lock_outline,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          isLast: true,
                                          isFirst: false,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.hidePassword.value =
                                                  !controller
                                                      .hidePassword.value;
                                            },
                                            color: Theme.of(context).focusColor,
                                            icon: Icon(controller
                                                    .hidePassword.value
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        );
                                      }),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Obx(() {
                                        return TextFieldWidget(
                                          // key: UniqueKey(),
                                          hintText: "••••••••••",
                                          labelText: "Re-Enter Password",
                                          initialValue: controller
                                              .currentUser!.value.password,
                                          onSaved: (input) => controller
                                              .currentUser!
                                              .value
                                              .password = input!,
                                          validator: (input) => input!.length <
                                                  3
                                              ? "Should be more than 3 characters"
                                                  .tr
                                              : null,
                                          obscureText: controller
                                              .hideConfirmPassword.value,
                                          iconData: Icons.lock_outline,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          isLast: true,
                                          isFirst: false,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.hideConfirmPassword
                                                      .value =
                                                  !controller
                                                      .hideConfirmPassword
                                                      .value;
                                            },
                                            color: Theme.of(context).focusColor,
                                            icon: Icon(controller
                                                    .hideConfirmPassword.value
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        );
                                      }),
                                    ],
                                  );
                                }
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              Obx(() {
                                return controller.loading == false
                                    ? BlockButtonWidget(
                                        onPressed: () {
                                          controller.register();
                                        },
                                        color: AppColors.maincolor,
                                        text: Text(
                                          "Continue".tr,
                                          style: Get.textTheme.titleMedium!
                                              .merge(const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ).paddingSymmetric(vertical: 5.0)
                                    : CircularProgressIndicator();
                              }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "If you already have account? ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Montserrat",
                                        fontSize: 12),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.LOGIN);
                                    },
                                    child: Text(
                                      "Login here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Montserrat",
                                          color: AppColors.greencolr,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
