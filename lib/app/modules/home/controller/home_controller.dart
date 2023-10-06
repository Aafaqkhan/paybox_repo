import 'package:get/get.dart';
import 'package:paybox/app/models/deals_model.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/loyalty/controller/loyalty_controller.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/repositories/home_repositories.dart';
// import 'package:paybox/app/models/category_model.dart' as cat;
// import 'package:paybox/app/models/category_model.dart';
// import 'package:paybox/app/repositories/home_repositories.dart';

import '../../../../commonWidget/ui.dart';

class HomeController extends GetxController {
  HomeRepository? _homeRepository;

  final trendingDeals = <TrendingDeals>[].obs;

  RxBool isTrendingDealsLoading = false.obs;

  LoyaltyController loyaltyController = LoyaltyController();
  PurchasesController purchasesController = PurchasesController();
  final DealsController dealsController = Get.put(DealsController());

  // RxDouble saleValue = RxDouble(0.0);

  int? calculateSaleValue(String startPrice, String dealPrice) {
    // Calculate the difference between start price and deal price
    int priceDifference = int.tryParse(startPrice)! - int.tryParse(dealPrice)!;

    // Calculate the percentage of concession granted
    int concessionPercentage =
        // 123;
        ((priceDifference / int.tryParse(startPrice)!) * 100).toInt();
    Get.log('concessionPercentage :: ${concessionPercentage.toString()}');
    return int.tryParse(concessionPercentage.toString());
    // Update the saleValue variable with the result
    // saleValue.value = concessionPercentage;
  }

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
    dealsController.getCategories();
    dealsController.getAllDeals();
  }

  Future getTrendingDeals() async {
    if (_homeRepository == null) Get.log('_homeRepository is null');
    try {
      isTrendingDealsLoading.value = true;
      trendingDeals.assignAll(await _homeRepository!.getTrendingDeals());
      Get.log('Treeeeeeeeeen');
      Get.log(trendingDeals.length.toString());
    } catch (e) {
      isTrendingDealsLoading.value = false;
      // Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isTrendingDealsLoading.value = false;
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
