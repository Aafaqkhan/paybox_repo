import 'package:get/get.dart';
import 'package:paybox/app/models/loyalty_model.dart';
import 'package:paybox/app/repositories/loyalty_repositories.dart';

import '../../../../commonWidget/ui.dart';

class LoyaltyController extends GetxController {
  RxBool collectPointsPanel = false.obs;

  List<Data> loyalties = <Data>[].obs;

  LoyaltyRepository? _loyaltyRepository;

  LoyaltyController() {
    _loyaltyRepository = LoyaltyRepository();
  }

  @override
  Future onInit() async {
    super.onInit();
    await getLoyalties();
  }

  Future getLoyalties() async {
    if (_loyaltyRepository == null) Get.log('_loyaltyRepository is null');
    try {
      loyalties.assignAll(await _loyaltyRepository!.getLoyalties());
      print(loyalties[0].name);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future refreshLoyalty({bool showMessage = false}) async {
    // await getSlider();
    await getLoyalties();
    // await getAllDeals();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }

  Future refreshBookings({bool showMessage = false, String? statusId}) async {
    // changeTab(statusId);
    if (showMessage) {
      // await getBookingStatuses();
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Bookings page refreshed successfully".tr));
    }
  }
}
