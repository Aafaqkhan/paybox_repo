import 'package:get/get.dart';
import 'package:paybox/app/models/purchase_model.dart';
import 'package:paybox/app/repositories/purchase_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

class PurchasesController extends GetxController {
  PurchaseRepository? _purchaseRepository;

  RxList<Data> purchases = <Data>[].obs;

  RxBool isPurchasesLoading = false.obs;

  // RxList<Data> filteredPurchases = <Data>[].obs;

  // void filterPurchases(String query) {
  //   filteredPurchases.value = purchases
  //       .where((purchase) =>
  //           purchase.name!.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }

  PurchasesController() {
    _purchaseRepository = PurchaseRepository();
  }

  @override
  Future onInit() async {
    super.onInit();
    await getPurchases();
  }

  Future getPurchases() async {
    isPurchasesLoading.value = true;
    if (_purchaseRepository == null) Get.log('_purchaseRepository is null');
    try {
      purchases.assignAll(await _purchaseRepository!.getPurchases());
      Get.log(purchases[0].businessName.toString());
      isPurchasesLoading.value = false;
    } catch (e) {
      // Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isPurchasesLoading.value = false;
    }
  }

  Future refreshPurchases({bool showMessage = false}) async {
    // await getSlider();
    await getPurchases();
    // await getAllDeals();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Purchases refreshed successfully"));
    }
  }
}
