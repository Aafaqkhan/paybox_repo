import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/models/deal_by_category_model.dart'
    as dealByCategorydata;
import 'package:paybox/app/models/nearest_deals_model.dart' as nearestdeals;

import 'package:paybox/app/repositories/deals_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

import 'package:paybox/app/models/filter_deals_model.dart' as filterdeals;

class DealsController extends GetxController {
  final categories = <categorydata.Data>[].obs;
  final allDeals = <alldealsdata.Data>[].obs;
  final dealByCategory = <dealByCategorydata.Data>[].obs;
  final nearestDealsList = <nearestdeals.Data>[].obs;
  final dealsByFilter = <filterdeals.Data>[].obs;

  RxBool nearMeSelected = false.obs;
  RxBool isPaymentSheetLoading = false.obs;
  RxBool filterApplied = false.obs;
  RxBool isFilterLoading = false.obs;

  // final RxInt selectedTabIndex = 0.obs; // Using RxInt for reactive updates

  // final RxString filter = 'category'.obs; // Using RxString for reactive updates

  // void updateSelectedTab(int index) {
  //   selectedTabIndex.value = index;

  //   // Update the filter based on the selected tab
  //   switch (index) {
  //     case 0:
  //       filter.value = 'sort';
  //       break;
  //     case 1:
  //       filter.value = 'location';
  //       break;
  //     case 2:
  //       filter.value = 'category';
  //       break;
  //   }
  // }

  // Getter for nearMeSelected
  bool get isNearMeSelected => nearMeSelected.value;

  bool get isfilterAppliedSelected => filterApplied.value;

  // Setter for nearMeSelected
  setNearMeSelected() {
    nearMeSelected.value = !nearMeSelected.value;
    update();
  }

  setFilterAppliedSelectedTrue() {
    filterApplied.value = true;
    update();
  }

  setFilterAppliedSelectedFalse() {
    filterApplied.value = false;
    update();
  }

  // RxBool categorySelected = false.obs;

  categorydata.Data? _categorySelected;
  categorydata.Data? get categorySelected => _categorySelected;
  set selectCategory(categorydata.Data? categ) {
    _categorySelected = categ;
    update();
  }
  // Rx<bool> categorySelected = false.obs;

  // List<bool> categorySelectedList =
  //     List.generate(categories.length, (_) => false);

  DealsRepository? _dealsRepository;

  GlobalKey<FormState>? paymentDetailsFormKey;

  DealsController() {
    _dealsRepository = DealsRepository();
    paymentDetailsFormKey = GlobalKey<FormState>();
  }

  @override
  void onInit() async {
    super.onInit();
    // categorySelectedList.assignAll(List.generate(5, (_) => false));
    await getCategories();
    await getAllDeals();
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

  Future dealsByCategory(String id) async {
    // final User user = authController.currentUser!.value;
    // Get.log('222 .. $user');
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // paymentDetailsFormKey!.currentState!.validate()
        ) {
      // Get.log('333 .. $user');

      // paymentDetailsFormKey!.currentState!.save();
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      // Get.log('ready to call dealsByCategory API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        if (_dealsRepository == null) Get.log('_dealsRepository is null');
        // allDeals.assignAll(await _dealsRepository!.getAllDeals());
        dealByCategory.assignAll(
            await _dealsRepository!.dealsByCategory(id)); // currentUser!.value
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

  Future nearestDeals(String lat, String lng) async {
    // final User user = authController.currentUser!.value;
    // Get.log('222 .. $user');
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // paymentDetailsFormKey!.currentState!.validate()
        ) {
      // Get.log('333 .. $user');

      // paymentDetailsFormKey!.currentState!.save();
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      // Get.log('ready to call dealsByCategory API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        if (_dealsRepository == null) Get.log('_dealsRepository is null');
        // allDeals.assignAll(await _dealsRepository!.getAllDeals());
        nearestDealsList.assignAll(await _dealsRepository!
            .nearestDeals(lat, lng)); // currentUser!.value
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

  Future filterDeals(
      {String filter = '',
      List categoryIds = const [],
      String sort = '',
      int radius = 1,
      String lat = '',
      String lng = '',
      String location = ''}) async {
    // final User user = authController.currentUser!.value;
    // Get.log('222 .. $user');
    Get.focusScope!.unfocus();
    if (isFilterLoading.value == false
        // paymentDetailsFormKey!.currentState!.validate()
        ) {
      // Get.log('333 .. $user');

      // paymentDetailsFormKey!.currentState!.save();
      // loginFormKey!.currentState!.save();
      isFilterLoading.value = true;
      // print("login here please");
      // Get.log('ready to call dealsByCategory API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        if (_dealsRepository == null) Get.log('_dealsRepository is null');
        // allDeals.assignAll(await _dealsRepository!.getAllDeals());
        dealsByFilter.assignAll(await _dealsRepository!.filterDeals(
            filter,
            categoryIds,
            sort,
            radius,
            lat,
            lng,
            location)); // currentUser!.value
        isFilterLoading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        isFilterLoading.value = false;
      }
    }
  }

  Future refreshDeals({bool showMessage = false}) async {
    // await getSlider();
    await getCategories();
    await getAllDeals();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
}
