import 'package:get/get.dart';
import 'package:paybox/app/models/purchase_model.dart';
import 'package:paybox/app/repositories/purchase_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

class PurchasesController extends GetxController {
  PurchaseRepository? _purchaseRepository;

  final purchases = <Data>[].obs;

  PurchasesController() {
    _purchaseRepository = PurchaseRepository();
  }

  @override
  Future onInit() async {
    super.onInit();
    // await getPurchases();
  }

  Future getPurchases() async {
    if (_purchaseRepository == null) Get.log('_purchaseRepository is null');
    try {
      purchases.assignAll(await _purchaseRepository!.getPurchases());
      // print(loyalties[0].name);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
<<<<<<< HEAD

  Future refreshPurchases({bool showMessage = false}) async {
    // await getSlider();
    await getPurchases();
    // await getAllDeals();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
=======
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
}
