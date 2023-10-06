import 'package:get/get.dart';
import 'package:paybox/app/models/loyalty_model.dart';
import 'package:paybox/app/repositories/loyalty_repositories.dart';

import '../../../../commonWidget/ui.dart';

class LoyaltyController extends GetxController {
  RxBool collectPointsPanel = false.obs;

  RxList<Data> loyalties = <Data>[].obs;

  RxBool isLoyaltyLoading = false.obs;

  RxInt? targetIndex = 0.obs;
  // RxList<Data> filteredLoyalties = <Data>[].obs;

  // void filterLoyalties(String query) {
  //   filteredLoyalties.value = loyalties
  //       .where((loyalty) =>
  //           loyalty.name!.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }

  // late List<RxBool> isPanelVisibleList = [];

  LoyaltyRepository? _loyaltyRepository;

  LoyaltyController() {
    _loyaltyRepository = LoyaltyRepository();
  }

  @override
  Future onInit() async {
    super.onInit();
    // filterLoyalties;

    await getLoyalties();
    // isPanelVisibleList = loyalties.map((_) => false.obs).toList();
  }

  Future getLoyalties() async {
    if (_loyaltyRepository == null) Get.log('_loyaltyRepository is null');
    try {
      isLoyaltyLoading.value = true;
      loyalties.assignAll(await _loyaltyRepository!.getLoyalties());
      print(loyalties[0].name);
      isLoyaltyLoading.value = false;
    } catch (e) {
      // Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isLoyaltyLoading.value = false;
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
          Ui.SuccessSnackBar(message: "Loyalty page refreshed successfully"));
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
