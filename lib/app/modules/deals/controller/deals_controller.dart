import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/repositories/deals_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

class DealsController extends GetxController {
  final categories = <categorydata.Data>[].obs;
  final allDeals = <alldealsdata.Data>[].obs;

  DealsRepository? _dealsRepository;

  GlobalKey<FormState>? paymentDetailsFormKey;

  DealsController() {
    _dealsRepository = DealsRepository();
    paymentDetailsFormKey = GlobalKey<FormState>();
  }

  @override
  void onInit() async {
    super.onInit();
    getCategories();
    getAllDeals();
  }

  Future getCategories() async {
    if (_dealsRepository == null) Get.log('_dealsRepository is null');
    try {
      categories.assignAll(await _dealsRepository!.getCategories());
      print(categories[0].name);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getAllDeals() async {
    if (_dealsRepository == null) Get.log('_dealsRepository is null');
    try {
      allDeals.assignAll(await _dealsRepository!.getAllDeals());
      print(allDeals[0].businessTitle);
      print(allDeals);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future purchaseDeal() async {
    // final User user = authController.currentUser!.value;
    // Get.log('222 .. $user');
    Get.focusScope!.unfocus();
    if (
        // 1 == 1
        // loading.value == false
        paymentDetailsFormKey!.currentState!.validate()) {
      // Get.log('333 .. $user');

      paymentDetailsFormKey!.currentState!.save();
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      Get.log('ready to call updateUser API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        if (_dealsRepository == null) Get.log('_dealsRepository is null');
        await _dealsRepository!.purchaseDeal(); // currentUser!.value
        // loading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        // loading.value = false;
      }
    }
  }

  Future refreshDeals({bool showMessage = false}) async {
    // await getSlider();
    await getCategories();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
}
