import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyCustomerSupport extends StatefulWidget {
  const MyCustomerSupport({
    super.key,
  });
  @override
  State<MyCustomerSupport> createState() => _MyCustomerSupportState();
}

class _MyCustomerSupportState extends State<MyCustomerSupport> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    profileController.complaintKey = GlobalKey<FormState>();
    return Form(
      key: profileController.complaintKey,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 491,
          width: 326,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 36, left: 25),
                child: TextWidget(
                    text: 'Customer Support',
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1025E4),
                        fontFamily: "Montserrat")),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, left: 9),
                child: TextWidget(
                    text:
                        'We will reply to your message within 24hrs  to the email address on your account ',
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff191D23),
                      fontFamily: "Montserrat",
                    )),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 20),
              //   child: TextWidget(
              //       text: ' to the email address on your account ',
              //       textStyle: TextStyle(
              //         fontSize: 12,
              //         fontWeight: FontWeight.w400,
              //         color: Color(0xff191D23),
              //         fontFamily: "Montserrat",
              //       )),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 24, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Color(0xff1025E4),
                    ),
                    TextWidget(
                        text: ' 08000096645 ',
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1C1B1F),
                          fontFamily: "Montserrat",
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email_rounded,
                      color: Color(0xff1025E4),
                    ),
                    TextWidget(
                        text: ' info@payboxuk.com',
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1C1B1F),
                          fontFamily: "Montserrat",
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, left: 4, bottom: 8),
                child: TextWidget(
                    text: ' Message',
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: SizedBox(
                  // height: 130,
                  child: TextFormField(
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 10) {
                        return 'Please write a proper complaint';
                      }
                      return null;
                    },
                    // obscureText: profileController.obsecureNewPassword.value,
                    decoration: const InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(
                      //     vertical: 10.0, horizontal: 10.0),
                      border: OutlineInputBorder(),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     profileController.obsecureNewPassword.value =
                      //         !profileController.obsecureNewPassword.value;
                      //   },
                      //   color: Theme.of(context).focusColor,
                      //   icon: Icon(profileController.obsecureNewPassword.value
                      //       ? Icons.visibility_outlined
                      //       : Icons.visibility_off_outlined),
                      // ),
                      // hintText: '●●●●●●●●●●●●●●',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff191D23)),
                    ),
                    onChanged: (value) {
                      profileController.complain.value = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 38,
                  left: 7,
                ),
                child: SizedBox(
                  height: 44,
                  width: 252,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: profileController
                                  .changePasswordLoading.value ==
                              false
                          ? () async {
                              if (profileController.complaintKey!.currentState!
                                  .validate()) {
                                await profileController.fileComplain(
                                    email: profileController
                                        .userProfile.value.email!,
                                    phone: authController
                                            .currentUser!.value.telephone ??
                                        '123',
                                    message: profileController.complain.value);
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1025E4)),
                      child:
                          profileController.changePasswordLoading.value == false
                              ? const TextWidget(
                                  text: 'Continue',
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFFFFFF)))
                              : const CircularProgressIndicator(),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
