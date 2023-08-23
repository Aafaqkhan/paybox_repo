import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/modules/profile/view/Loyalty_points.dart';
import 'package:paybox/app/modules/profile/view/change_password.dart';
import 'package:paybox/app/modules/profile/view/customer_support.dart';
import 'package:paybox/app/modules/profile/view/delete_acc.dart';
import 'package:paybox/app/modules/profile/view/edit_profile.dart';
import 'package:paybox/app/routes/app_routes.dart';
import 'package:paybox/app/services/global_profile.dart';
import '../../../services/colors/custom_colors.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthController authController =
      Get.put(AuthController()); // Initialize AuthController

  final _box = GetStorage();

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: ChangePassword(),
        );
      },
    );
  }

  void _showCustomerSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: MyCustomerSupport(),
        );
      },
    );
  }

  void _showLoyaltyPointsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: LoyaltyPoints(),
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DeleteAccount(
            onPressed: () async {
              // final authController = Get.find<AuthController>();
              authController.loginLoading = false.obs;
              authController.signupLoading = false.obs;
              await controller.getDeleteUser();
              await _box.erase();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        );
      },
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: EditProf(),
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                // Perform logout logic here
                // For example, clear user session and navigate to login screen
                // logoutUser();
                final authController = Get.find<AuthController>();
                authController.loginLoading = false.obs;
                authController.signupLoading = false.obs;

                await _box.erase();
                Navigator.of(context).pop();
                Get.toNamed(Routes.LOGIN);
                // Close the dialog
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();

    final name = _box.read('name');
    final email = _box.read('email');

    controller.updateUser();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 56.87,
        backgroundColor: const Color(0xff1025E4),
        title: const TextWidget(
          text: 'Profile',
          textStyle: TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 19),
                    child: SizedBox(
                      width: 146,
                      height: 100,
                      child: Image.asset('assets/images/Group 69.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: SizedBox(
                        width: 190,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: name ?? 'Guest',
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                            TextWidget(
                                text: email ?? "Guest@guest.com",
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000))),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                width: 100,
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showEditProfileDialog(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff717CF1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: const TextWidget(
                                      text: 'Edit Profile',
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF))),
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 28,
              ),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    width: 335,
                    // alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Color(0xff000000),
                        width: 0.2,
                        style: BorderStyle.solid,
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _showLoyaltyPointsDialog(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextWidget(
                              text: "Loyalty Points",
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1B1F),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20, top: 7),
                          child: TextWidget(
                              text: "100+",
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                color: Color(0xff3242F6),
                              )),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showChangePasswordDialog(context);
                    },
                    child: const MyGlobalProfile(
                      title: "Change Password ",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showCustomerSupportDialog(context);
                    },
                    child: const MyGlobalProfile(
                      title: "Customer Support ",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PRIVACYPOLICY);
                    },
                    child: const MyGlobalProfile(
                      title: "Privacy & Policy ",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.TERMCONDITION);
                    },
                    child: const MyGlobalProfile(
                      title: "Terms & Conditions ",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.ABOUTUS);
                    },
                    child: const MyGlobalProfile(
                      title: "About Us ",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showDeleteAccountDialog(context);
                    },
                    child: const MyGlobalProfile(
                      title: "Delete Account ",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showLogoutDialog(context);
                      // Get.toNamed(Routes.LOGIN);
                    },
                    child: const MyGlobalProfile(
                      title: "Logout ",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
