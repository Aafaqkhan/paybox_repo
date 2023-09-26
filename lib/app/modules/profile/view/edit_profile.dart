import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paybox/app/models/user_model.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:get/get.dart';
import 'package:paybox/commonWidget/block_button_widget.dart';
import 'package:paybox/commonWidget/text_field_widget.dart';

import 'package:dio/dio.dart' as dio;
// import 'package:get/get_connect/http/src/multipart/form_data.dart'
// as getFormData;
// For selecting images
// For File

class EditProf extends GetView<ProfileController> {
  EditProf({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  // final ProfileController _profileController = Get.put(ProfileController());

  // void _saveProfile() async {

  // File? _pickedImage; // Variable to store the picked image

  // Future<void> _pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     // setState(() {
  //     _pickedImage = File(pickedImage.path);
  //     // });
  //   }
  // }
  // File? pickedImage;

  // void pickImage() async {
  //   final pickedImageFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedImageFile != null) {
  //     pickedImage = File(pickedImageFile.path);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455,
      width: 326,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 7, right: 7, top: 38),
              child: TextWidget(
                  text: 'Edit Profile',
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1025E4),
                    fontFamily: "Montserrat",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 72, top: 12),
              child: GestureDetector(
                onTap: () {
                  // pickImage();
                  controller.pickImage();
                },
                child: Obx(() {
                  return SizedBox(
                    height: 90,
                    width: 100,
                    child: Stack(
                      children: [
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 3, color: const Color(0xff1025E4))),
                          child: CircleAvatar(
                            backgroundImage: controller.pickedImage.value !=
                                    null
                                ? FileImage(controller
                                    .pickedImage.value!) // Display picked image
                                : null, // If no image picked, display nothing
                            child: controller.pickedImage.value == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                  ) // Display an icon if no image
                                : null,
                          ),
                          //  Icon(
                          //   Icons.person,
                          //   size: 50,
                          // ),
                        ),
                        Positioned(
                          left: 70,
                          top: 10,
                          child: Container(
                            height: 24,
                            width: 24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.camera_alt,
                                size: 16, color: Color(0xff1025E4)),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            Form(
                key: controller.profileFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 7, bottom: 0, top: 11),
                    //   child: TextWidget(
                    //       text: 'Name',
                    //       textStyle: TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w600,
                    //           fontFamily: "Montserrat",
                    //           color: Color(0xff000000))),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                        right: 7,
                      ),
                      child: TextFieldWidget(
                        hintText: "Adward James",
                        labelText: "Name",
                        initialValue:
                            controller.currentUser?.value.name ?? 'Guest',
                        onSaved: (input) =>
                            controller.currentUser!.value.name = input!,
                        validator: (input) => input!.length < 3
                            ? "Should be more than 3 characters".tr
                            : null,
                        isFirst: true,
                        isLast: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        top: 18,
                        bottom: 0,
                      ),
                      child: TextFieldWidget(
                        hintText: "09876543987",
                        labelText: "Phone Number",
                        initialValue: controller.currentUser!.value.telephone,
                        onSaved: (input) =>
                            controller.currentUser!.value.telephone = input!,
                        isFirst: false,
                        isLast: false,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 7, right: 7),
                    //   child: TextFieldWidget(
                    //     onSaved: (input) =>
                    //         controller.currentUser!.value.name = input!,
                    //     validator: (input) => input!.length < 4
                    //         ? "Should be more than 4 characters".tr
                    //         : null,
                    //     // controller: mobileController,
                    //     // decoration: const InputDecoration(
                    //     //   border: OutlineInputBorder(),
                    //     // ),
                    //   ),
                    // ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.only(top: 24, left: 7),
                        child: SizedBox(
                          width: 330,
                          height: 44,
                          // alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          //     color: const Color(0xff1025E4),
                          //     borderRadius: BorderRadius.circular(4)),
                          child: controller.editProfileLoading == false
                              ? BlockButtonWidget(
                                  onPressed: () async {
                                    await controller.updateUser();
                                    Get.log(controller.pickedImage.value!.path
                                        .toString());

                                    // await controller.updateProfileImage();

                                    await controller.updateProfilePicture(
                                        controller.pickedImage.value);
                                    await controller.getUserProfile();
                                    Navigator.pop(context);
                                  },
                                  color: const Color(0xff3242F6),
                                  text: const Text('Save',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF))),
                                )
                              : const Align(
                                  alignment: Alignment
                                      .center, // Center the CircularProgressIndicator
                                  child: SizedBox(
                                    width:
                                        30, // Adjust the width to your desired value
                                    height: 40,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                      );
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
