import 'package:get/get.dart';
// import 'package:paybox/app/models/category_model.dart' as cat;
// import 'package:paybox/app/models/category_model.dart';
// import 'package:paybox/app/repositories/home_repositories.dart';

import '../../../../commonWidget/ui.dart';

class HomeController extends GetxController {
  // HomeRepository? _homeRepository;

  // RxList<cat.Data> data = <cat.Data>[].obs;

  // HomeController() {
  //   _homeRepository = HomeRepository();
  // }

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
  //   // Get.focusScope!.unfocus();
  //   // if (registerFormKey!.currentState!.validate()) {
  //   //   registerFormKey!.currentState!.save();
  //   //   loading.value = true;
  //   // print("register here please");
  //   print('ready to fetch Categories apis');
  //   try {
  //     await _homeRepository!.getCategories();
  //     print('before data');
  //     List<cat.Data> data = await _homeRepository!.getCategories();
  //     print('After data');

  //     // print(fetchedCategories);
  //     // print('111..FC');
  //     // data.assignAll(fetchedCategories);
  //     print(data);
  //     print('222.. FC');
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
    // await getCategories();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
}
