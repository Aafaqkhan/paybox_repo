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
import 'package:paybox/app/providers/laravel_provider.dart';
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
        return AlertDialog(
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
        return AlertDialog(
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
    GetStorage? _box = GetStorage();

    var token = _box!.read('token');
    // final _box = GetStorage();
    // controller.getUserProfile();
    // final name = _box.read('name');
    // final email = _box.read('email');

    // var completeUrl =
    //     "https://paybox.jzmaxx.com/${controller.userProfile.value.avatar}";

    // var imageUrl = controller.userProfile.value.avatar;

    // User userModel = User(); // Create an instance of UserModel
    // controller.getUserProfile();
    // controller.updateUser();
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
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshProfileScreen(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: token == null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Please ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
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
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Obx(() {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 19, left: 19, right: 19),
                              child: CircleAvatar(
                                radius: 35,

                                // width: 146,
                                // height: 100,
                                child:
                                    controller.userProfile.value.avatar == null
                                        ? const Icon(
                                            Icons.person,
                                            size: 45,
                                          )
                                        : ClipOval(
                                            child: Image.network(
                                              // "https://paybox.jzmaxx.com/storage/users/KucleV9bZlnKsRpFO0dIbodnQlXmIu6Hzclxbs3h.jpg",
                                              "https://paybox.jzmaxx.com/storage/users/${controller.userProfile.value.imageName}",
                                              fit: BoxFit.cover,
                                              height: 70,
                                              width: 70,
                                            ),
                                          ),
                                // Image.network(
                                //     'https://paybox.jzmaxx.com/images/profile/1693228236.jpeg',
                                //     // width: 70,
                                //     // height: 70,
                                //     fit: BoxFit.cover,
                                //   ),
                                // Image.asset('assets/images/Group 69.png'),
                              ),
                            );
                          }),
                          Obx(() {
                            return Padding(
                              padding: const EdgeInsets.only(top: 31, left: 8),
                              child: SizedBox(
                                  width: 190,
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          text: controller
                                                  .userProfile.value.name
                                                  .toString() ??
                                              'Guest',
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000))),
                                      TextWidget(
                                          text: controller
                                                  .userProfile.value.email
                                                  .toString() ??
                                              "Guest@guest.com",
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          width: 110,
                                          height: 32,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Get.log(imageUrl.toString());
                                              Get.log(controller
                                                  .userProfile.value.imageName
                                                  .toString());
                                              _showEditProfileDialog(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff717CF1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                            );
                          })
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: null,
                                  // () {
                                  //   _showLoyaltyPointsDialog(context);
                                  // },
                                  child: Padding(
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
                                Padding(
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
      ),
    );
  }
}
