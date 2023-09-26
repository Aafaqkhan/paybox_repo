import 'package:get/get.dart';
import 'package:paybox/app/models/deals_model.dart';
import 'package:paybox/app/modules/loyalty/controller/loyalty_controller.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/repositories/home_repositories.dart';
// import 'package:paybox/app/models/category_model.dart' as cat;
// import 'package:paybox/app/models/category_model.dart';
// import 'package:paybox/app/repositories/home_repositories.dart';

import '../../../../commonWidget/ui.dart';

class HomeController extends GetxController {
  HomeRepository? _homeRepository;

  final trendingDeals = <TrendingDealsModel>[].obs;

  LoyaltyController loyaltyController = LoyaltyController();
  PurchasesController purchasesController = PurchasesController();

  HomeController() {
    _homeRepository = HomeRepository();
    loyaltyController = LoyaltyController();
  }

  @override
  Future onInit() async {
    super.onInit();
    getTrendingDeals();
    loyaltyController.getLoyalties();
    purchasesController.getPurchases();
  }

  Future getTrendingDeals() async {
    if (_homeRepository == null) Get.log('_homeRepository is null');
    try {
      trendingDeals.assignAll(await _homeRepository!.getTrendingDeals());
      Get.log('Treeeeeeeeeen');
      Get.log(trendingDeals.length.toString());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  // void getDeals() async {
  //   print(_homeRepository);
  //   // Get.focusScope!.unfocus();
  //   // if (registerFormKey!.currentState!.validate()) {
  //   //   registerFormKey!.currentState!.save();
  //   //   loading.value = true;
  //   // print("register here please");
  //   print('ready to fetch deals apis');
  //   try {
  //     // if (_homeRepository != null) print('nullee homeee');
  //     await _homeRepository!.getDeals();
  //     // loading.value = false;
  //     // print('before going to home page');
  //     // Get.toNamed(Routes.LOGIN);
  //     // print('After went to home page');
  //   } catch (e) {
  //     print(e.toString());
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //     print('snaaaaaaaaak bar');
  //   } finally {
  //     // loading.value = false;
  //   }
  //   // }
  // }

  // void getDealById() async {
  //   print(_homeRepository);
  //   // Get.focusScope!.unfocus();
  //   // if (registerFormKey!.currentState!.validate()) {
  //   //   registerFormKey!.currentState!.save();
  //   //   loading.value = true;
  //   // print("register here please");
  //   print('ready to fetch getDealById apis');
  //   try {
  //     // if (_homeRepository != null) print('nullee homeee');
  //     await _homeRepository!.getDealById();
  //     // loading.value = false;
  //     // print('before going to home page');
  //     // Get.toNamed(Routes.LOGIN);
  //     // print('After went to home page');
  //   } catch (e) {
  //     print(e.toString());
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //     print('snaaaaaaaaak bar');
  //   } finally {
  //     // loading.value = false;
  //   }
  //   // }
  // }

  // Future getCategories() async {
  //   // }
  // }

  // void getStores() async {
  //   // Get.focusScope!.unfocus();
  //   // if (registerFormKey!.currentState!.validate()) {
  //   //   registerFormKey!.currentState!.save();
  //   //   loading.value = true;
  //   // print("register here please");
  //   print('ready to fetch store apis');
  //   try {
  //     await _homeRepository!.getStores();
  //     // loading.value = false;
  //     // print('before going to home page');
  //     // Get.toNamed(Routes.LOGIN);
  //     // print('After went to home page');
  //   } catch (e) {
  //     print(e.toString());
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //     print('snaaaaaaaaak bar');
  //   } finally {
  //     // loading.value = false;
  //   }
  //   // }
  // }

  Future refreshHome({bool showMessage = false}) async {
    // await getSlider();
    await purchasesController.getPurchases();
    await loyaltyController.getLoyalties();
    await getTrendingDeals();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
}
