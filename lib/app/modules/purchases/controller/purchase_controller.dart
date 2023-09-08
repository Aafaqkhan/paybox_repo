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
}
