import 'package:get/get.dart';

import '../../../../commonWidget/ui.dart';

class LoyaltyController extends GetxController {
  RxBool collectPointsPanel = false.obs;

  Future refreshBookings({bool showMessage = false, String? statusId}) async {
    // changeTab(statusId);
    if (showMessage) {
      // await getBookingStatuses();
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "Bookings page refreshed successfully".tr));
    }
  }
}
