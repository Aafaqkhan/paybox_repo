import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileController.changePasswordFormKey = GlobalKey<FormState>();
    return Form(
      key: profileController.changePasswordFormKey,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 475,
          width: 326,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextWidget(
                    text: 'Change Password',
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1025E4))),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  bottom: 8,
                ),
                child: TextWidget(
                    text: 'Old Password',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191D23))),
              ),
              SizedBox(
                // height: 40,
                width: 252,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length < 6) {
                      return 'Password should be atleast 6 characters';
                    } else if (value !=
                        profileController.currentUser!.value.password) {
                      return 'Password Incorrect';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Old Password',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff191D23)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 21,
                  bottom: 8,
                ),
                child: TextWidget(
                    text: 'New Password',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191D23))),
              ),
              Obx(() {
                return SizedBox(
                  // height: 40,
                  width: 252,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 6) {
                        return 'Password should be atleast 6 characters';
                      }
                      return null;
                    },
                    obscureText: profileController.obsecureNewPassword.value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          profileController.obsecureNewPassword.value =
                              !profileController.obsecureNewPassword.value;
                        },
                        color: Theme.of(context).focusColor,
                        icon: Icon(profileController.obsecureNewPassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      hintText: '●●●●●●●●●●●●●●',
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff191D23)),
                    ),
                    onChanged: (value) {
                      profileController.newPassword.value = value;
                    },
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.only(
                  top: 18,
                  bottom: 8,
                ),
                child: TextWidget(
                    text: 'Confirm Password',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191D23))),
              ),
              Obx(() {
                return SizedBox(
                  // height: 40,
                  width: 252,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 6) {
                        return 'Password should be atleast 6 characters';
                      } else if (value != profileController.newPassword.value) {
                        return 'Password doesnot match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      profileController.confirmNewPassword.value = value;
                    },
                    obscureText:
                        profileController.obsecureconfirmNewPassword.value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          profileController.obsecureconfirmNewPassword.value =
                              !profileController
                                  .obsecureconfirmNewPassword.value;
                        },
                        color: Theme.of(context).focusColor,
                        icon: Icon(
                            profileController.obsecureconfirmNewPassword.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                      ),
                      hintText: '●●●●●●●●●●●●●●',
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff191D23)),
                    ),
                  ),
                );
              }),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: SizedBox(
                    height: 44,
                    width: 252,
                    child: ElevatedButton(
                      onPressed:
                          profileController.changePasswordLoading.value == false
                              ? () async {
                                  if (profileController
                                      .changePasswordFormKey!.currentState!
                                      .validate()) {
                                    await profileController.changePassword();
                                    Navigator.pop(context);
                                  }
                                }
                              : null,
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.grey,
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
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
